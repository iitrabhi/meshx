# meshx

A simple tool to convert mesh created from Gmsh to XDMF for use in FEniCS. This work is derived from the work done during my [GSoC project](https://github.com/iitrabhi/GSoC2019) and is based on the following [snippet of code](https://gist.github.com/michalhabera/bbe8a17f788192e53fd758a67cbf3bed) made by [Michal Habera](https://github.com/michalhabera).

## Getting Started

To use this tool you have to use the docker image [provided here](https://github.com/iitrabhi/fenics-docker). It has all the correct version of different libraries that are supported by this tool.

### Installing

You can install this with the following commands:

```
sudo -H pip install meshx
```

## Running

Run the following in the directory which contains the `.msh` file.

```
meshx plate.msh
```

### Example problem:

```
cd demo/poisson_problem
meshx plate.msh
```
This command will give you 2 folders -  
1. mesh - This folder will contain the data that we will use in the script i.e, the XDMF files for different entities of mesh and the JSON file containing the corresponding tag names and tag values.
2. sub_domains - This folder will contain the XDMF files of different subdomains marked. These files can be visualised in Paraview for validating the correctness of the marked subdomain.


```
python3 main.py
```

## Notes
 
This repository is tested with the Docker image [provided here](https://github.com/iitrabhi/fenics-docker). This Docker image has all the correct version of libraries required for this tool. If you want to use this tool with your Docker image then please install all the different libraries mentioned in the above repository. 

## Development

Install the repository in editable mode for development. Go to the root folder containing `setup.py` and run the following in terminal.

```bash
sudo -H pip install -e .
```

## Authors

* [Abhinav Gupta](https://github.com/iitrabhi)
* [Meenu Krishnan](https://github.com/umeenukrishnan)
