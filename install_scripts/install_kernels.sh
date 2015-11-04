#!/bin/bash

echo "installing kernels"

/home/spp
mkdir jupyter_kernels
cd jupyter_kernels
git clone https://github.com/gap-system/jupyter-gap.git
git clone https://github.com/sebasguts/jupyter-singular.git
git clone https://github.com/sebasguts/jupyter-polymake.git
cd jupyter-gap/wrapper-kernel
sudo python3 setup.py install
sudo python3 -m jupyter_gap_wrapper.install
cd /home/spp/jupyter_kernels
cd jupyter-singular/wrapper-kernel
sudo python3 setup.py install
sudo python3 -m jupyter_singular_wrapper.install
cd /home/spp/jupyter_kernels
cd jupyter-polymake/wrapper-kernel
sudo python3 setup.py install
sudo python3 -m jupyter_polymake_wrapper.install
cd /home/spp/jupyter_kernels