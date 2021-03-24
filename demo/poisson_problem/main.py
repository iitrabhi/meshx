from dolfin import *
import json 
import os


# Define mesh
mesh = Mesh()
with XDMFFile("mesh/triangle.xdmf") as infile:
    infile.read(mesh)

mvc_1 = MeshValueCollection("size_t", mesh, 1)
mvc_2 = MeshValueCollection("size_t", mesh, 2)

f = open('mesh/tags.json') 
tags = json.load(f)

with XDMFFile("mesh/line.xdmf") as infile:
    print("Reading 1d line data into dolfin mvc")
    infile.read(mvc_1, "tag")

print("Constructing MeshFunction from MeshValueCollection")
boundaries = cpp.mesh.MeshFunctionSizet(mesh, mvc_1)

with XDMFFile("mesh/triangle.xdmf") as infile:
    print("Reading 2d surface data into dolfin mvc")
    infile.read(mvc_2, "tag")

print("Constructing MeshFunction from MeshValueCollection")
domains = cpp.mesh.MeshFunctionSizet(mesh, mvc_2)



# Define input data
a0 = Constant(1.0)
a1 = Constant(0.01)
g_L = Expression("- 10*exp(- pow(x[1] - 0.5, 2))" , degree = 2)
g_R = Constant("1.0")
f = Constant(1.0)

# Define function space and basis functions
V = FunctionSpace(mesh, "CG", 2)
u = TrialFunction(V)
v = TestFunction(V)

# Define Dirichlet boundary conditions at top and bottom boundaries
bcs = [DirichletBC(V, 5.0, boundaries, tags['Top']),
       DirichletBC(V, 0.0, boundaries, tags['Bottom'])]

# Define new measures associated with the interior domains and
# exterior boundaries
dx = Measure("dx")(subdomain_data=domains)
ds = Measure("ds")(subdomain_data=boundaries)

# Define variational form
F = (inner(a0*grad(u), grad(v))*dx(tags['Domain']) + inner(a1*grad(u), grad(v))*dx(tags['Obstacle'])
     - g_L*v*ds(tags['Left']) - g_R*v*ds(tags['Right'])
     - f*v*dx(tags['Domain']) - f*v*dx(tags['Obstacle']))

# Separate left and right hand sides of equation
a, L = lhs(F), rhs(F)

# Solve problem
u = Function(V)
solve(a == L, u, bcs)

# Evaluate integral of normal gradient over top boundary
n = FacetNormal(mesh)
m1 = dot(grad(u), n)*ds(tags['Top'])
v1 = assemble(m1)
print ("\int grad(u) * n ds(Top) = ", v1)

# Evaluate integral of u over the obstacle
m2 = u*dx(tags['Obstacle'])
v2 = assemble(m2)
print ("\int u dx(Obstacle) = ", v2)
