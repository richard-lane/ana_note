#!/bin/bash

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

IMG_DIR="$(dirname $SCRIPT_DIR)/img/"
mkdir -p $IMG_DIR

for filename in ${SCRIPT_DIR}/*.tex; do
    pdflatex -halt-on-error -output-directory img $filename
done

# Cleanup build artefacts
for filename in ${IMG_DIR}/*.{aux,log}; do
    rm $filename
done
