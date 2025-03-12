#!/bin/sh -e

if [ "$1" == "--help" -o "$1" == "-h" -o "$1" == "" ]; then
    echo "This container runs the ynl/cli.py netlink client"
    echo
    echo "The genetlink.yaml schema is automatically applied for you"
    echo
    echo "You must supply a '--spec' argument, whose valid values are:"
    find specs/ | tail -n +2 | sed 's/^/  /'
    echo
    echo "The rest of the command usage is as follows:"
    echo
    ./cli.py --help
    exit 0
fi

./cli.py --schema "schemas/genetlink.yaml" "$@"
