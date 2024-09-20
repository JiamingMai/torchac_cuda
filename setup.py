from setuptools import setup, Extension
from torch.utils import cpp_extension

setup(
    name='torchac_cuda',
    ext_modules=[
        cpp_extension.CUDAExtension(
            'torchac_cuda', 
            [
                'main.cpp',
                'torchac_kernel_enc_new.cu',
                'torchac_kernel_dec_new.cu',
                'cal_cdf.cu',
            ],
            #extra_compile_args={'cxx': ['-g'],
            #                    'nvcc': ['-G', '-g']},
            include_dirs=['./include']
            ),
        
    ],
    cmdclass={
        'build_ext': cpp_extension.BuildExtension
    }
)
