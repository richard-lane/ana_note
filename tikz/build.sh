#!/bin/bash

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

IMG_DIR="$(dirname $SCRIPT_DIR)/img/"
mkdir -p $IMG_DIR

echo "Compiling pdfs"
for filename in ${SCRIPT_DIR}/*.tex; do
    pdflatex -halt-on-error -output-directory $IMG_DIR ${filename}
done

# Convert to pngs
echo "converting to png"
for filename in ${IMG_DIR}/*.pdf; do
    convert -density 300 -quality 90 $filename ${filename%.*}.png
done

# Cleanup build artefacts
echo "cleanup"
for filename in ${IMG_DIR}/*.{aux,log,pdf}; do
    rm $filename
done
