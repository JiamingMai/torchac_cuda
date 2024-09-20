#!/bin/bash

mkdir -p repaired

rm -rf build/*
rm -rf dist/*

python setup.py sdist bdist_wheel
auditwheel repair dist/torchac_cuda-0.1.0-cp310-cp310-linux_x86_64.whl -w repaired/
