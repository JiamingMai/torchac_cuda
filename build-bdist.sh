#!/bin/bash
#
# Should be executed in docker: 
#   docker pull sameli/manylinux_2_28_x86_64_cuda_12.3
#   docker run -it --rm -v /path/to/your/package:/io sameli/manylinux_2_28_x86_64_cuda_12.3 /bin/bash

set -e

dnf install python3.11-devel wget
wget https://bootstrap.pypa.io/get-pip.py
python3 ./get-pip.py

cd /io

mkdir -p repaired
rm -rf build/*
rm -rf dist/*

pip install torch==2.4.0

TORCH_CUDA_ARCH_LIST="8.0 8.6 8.9 9.0" python3 -m build --wheel --outdir dist/

LD_LIBRARY_PATH=/usr/local/lib64/python3.11/site-packages/torch/lib/:/usr/local/lib/python3.11/site-packages/nvidia/nvtx/lib/:/usr/local/lib/python3.11/site-packages/nvidia/cudnn/lib/:/usr/local/lib/python3.11/site-packages/nvidia/cuda_cupti/lib/:/usr/local/lib/python3.11/site-packages/nvidia/nccl/lib auditwheel repair dist/*.whl -w /io/wheelhouse
