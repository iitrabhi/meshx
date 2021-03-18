import meshio
import json
from dolfin import *
import subprocess, os, platform
import sys
from tabulate import tabulate


def write(args):
    converter = Converter(args.infile)
    converter.write_mesh()
    converter.write_boundaries()
    pass


class Converter:
    def __init__(self, infile):
        self.msh = None
        self.tag_list = None
        self.read_msh(infile)

    def read_msh(self, infile):
        # Save the primary mesh in directory named mesh in the current folder.
        if not os.path.exists("mesh"):
            os.makedirs("mesh")
        if not os.path.exists('boundaries'):
            os.makedirs('boundaries')   

        try:
            self.msh = meshio.read(infile)
            self.tag_list = [[key, value[0], value[1] ] for key,value in self.msh.field_data.items()]
            print(tabulate(self.tag_list, headers=["String tag", "Num Tag", "Dim"]))
            pass
        except:
            print("File not found 😱")
            sys.exit(1)

    def write_mesh(self):
        try:
            meshio_point = self.msh.points[:, :]
            for entity in self.msh.cell_data.keys():
                print("Creating", entity, "mesh")
                meshio_cell = {entity: self.msh.cells[entity]}
                meshio_tag = {entity: {"tag": self.msh.cell_data[entity]["gmsh:physical"]}}
                meshio_mesh = meshio.Mesh(points=meshio_point, cells=meshio_cell, cell_data=meshio_tag)
                meshio.write("mesh/" + entity + ".xdmf", meshio_mesh)
            print("XDMF created! 🎉🥳")
        except:
            print("There was some error 😱")

    def write_boundaries(self):
        mesh_functions = [None, None, None, None]
        vertex_tags = {}
        line_tags = {}
        triangle_tags = {}
        tetra_tags = {}
        all_tags = {}
        tag_dicts = [vertex_tags, line_tags, triangle_tags, tetra_tags]
        msh = self.msh

        for field in msh.field_data.keys():
            dim = msh.field_data[field][1]
            tag = int(msh.field_data[field][0])
            # print("Dimension: ",str(dim))
            tag_dicts[dim][field] = tag
            all_tags[field] = tag

        with open("boundaries/tags.json", "w") as outfile:
            json.dump(all_tags, outfile)
        # Create a mesh function corresponding to each tag
        # before this it is necessary to load mesh
        dim = 0
        mf_name = [
            "boundaries/vertex_boundaries.xdmf",
            "boundaries/line_boundaries.xdmf",
            "boundaries/triangle_boundaries.xdmf",
            "boundaries/tetra_boundaries.xdmf"
        ]
        mesh_name = ["mesh/vertex.xdmf", "mesh/line.xdmf", "mesh/triangle.xdmf", "mesh/tetra.xdmf"]
        for entity_tag_dict in tag_dicts:
            if entity_tag_dict:
                mesh = Mesh()
                with XDMFFile(mesh_name[dim]) as infile:
                    infile.read(mesh)
                mvc = MeshValueCollection("size_t", mesh, dim)
                with XDMFFile(mesh_name[dim]) as infile:
                    infile.read(mvc, "tag")
                mf_in = cpp.mesh.MeshFunctionSizet(mesh, mvc)
                mesh_functions[dim] = mf_in
                xdmf = XDMFFile(mf_name[dim])
                # print("Writing to ", str(mf_name[dim]))
                mf_out = MeshFunction("size_t", mesh, dim)
                xdmf.write(mesh)
                for tag_name in entity_tag_dict.keys():

                    value = entity_tag_dict[tag_name]
                    # print(value, "\t", tag_name)
                    mf_out.set_all(0)

                    mf_out.array()[mf_in.where_equal(value)] = value
                    mf_out.rename(tag_name, tag_name)

                    # print(mf_out.array())
                    xdmf.write(mf_out)
                xdmf.close()
            dim += 1
