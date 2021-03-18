"""
Plot xy data from text file.
"""
from ._helpers import write


def main(argv=None):
    # Parse command line arguments.
    parser = _get_parser()
    args = parser.parse_args(argv)

    # plot
    write(args)
    # print(args)
    return


def _get_parser():
    """Parse input options."""
    import argparse

    parser = argparse.ArgumentParser(
        description=("Convert msh to xdmf"), formatter_class=argparse.RawTextHelpFormatter
    )

    parser.add_argument(
        "infile", type=str, help=".msh file generated using Gmsh."
    )

    return parser
