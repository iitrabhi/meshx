# meshx

A simple tool to convert mesh created from Gmsh to XDMF for use in FEniCS

## Getting Started

To use this tool you have to use the docker image [provided here](https://github.com/iitrabhi/fenics-docker). It has all the correct version of different libraries that are supported by this tool.

### Installing

You can install this with the following commands:

```
pip install meshx
```

## Running

Run the following in the directory which contains the `.msh` file.

```
meshx plate.msh
```

## Notes

## Development

Install the repository in editable mode for development. Go to the root folder containing `setup.py` and run the following in terminal.

```bash
sudo -H pip install -e .
```

## Authors

* [Abhinav Gupta](https://github.com/iitrabhi)
* [Meenu Krishnan](https://github.com/umeenukrishnan)
