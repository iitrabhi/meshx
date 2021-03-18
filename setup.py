import codecs
import os

from setuptools import find_packages, setup

# https://packaging.python.org/single_source_version/
base_dir = os.path.abspath(os.path.dirname(__file__))
about = {}
with open(os.path.join(base_dir, "meshx", "__about__.py"), "rb") as f:
    exec(f.read(), about)


def read(fname):
    return codecs.open(os.path.join(base_dir, fname), encoding="utf-8").read()


setup(
    name="meshx",
    version=about["__version__"],
    author=about["__author__"],
    author_email=about["__author_email__"],
    packages=find_packages(),
    description="A simple tool to convert mesh created from Gmsh to XDMF for use in FEniCS",
    long_description=read("README.md"),
    long_description_content_type="text/markdown",
    url="https://github.com/iitrabhi/meshx",
    license=about["__license__"],
    platforms="any",
    install_requires=["meshio","tabulate"],
    python_requires=">=3",
    classifiers=[
        about["__status__"],
        about["__license__"],
        "Intended Audience :: Science/Research",
        "Operating System :: OS Independent",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Topic :: Scientific/Engineering",
    ],
    entry_points={"console_scripts": ["meshx = meshx._cli:main"]},
)