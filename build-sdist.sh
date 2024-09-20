#!/bin/bash
set -e

mkdir -p repaired

rm -rf build/*
rm -rf dist/*

python -m build --sdist --outdir dist/

twine upload --repository testpypi dist/*

