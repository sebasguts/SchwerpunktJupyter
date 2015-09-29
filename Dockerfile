## Dockerfile for the DFG SPP Computeralgebra Software Jupyter kernels

FROM sebasguts/sppdocker

MAINTAINER Sebastian Gutsche <sebastian.gutsche@gmail.com>

RUN    sudo ln -snf $(which python3) /usr/local/bin/python \
    && && sudo ln -snf /usr/bin/gap /usr/bin/gap.sh \
    && sudo apt-get install -y python3-pip \
    && sudo pip3 install jupyter \
    && cd /home/spp \
    && mkdir jupyter_kernels \
    && cd jupyter_kernels \
    && git clone https://github.com/gap-system/jupyter-gap.git \
    && git clone https://github.com/sebasguts/jupyter-singular.git \
    && git clone https://github.com/sebasguts/jupyter-polymake.git \
    && cd jupyter-gap/wrapper-kernel \
    && sudo python3 setup.py install \
    && sudo python3 -m jupyter_gap_wrapper.install \
    && cd /home/spp/jupyter_kernels \
    && cd jupyter-singular/wrapper-kernel \
    && sudo python3 setup.py install \
    && sudo python3 -m jupyter_singular_wrapper.install \
    && cd /home/spp/jupyter_kernels \
    && cd jupyter-polymake/wrapper-kernel \
    && sudo python3 setup.py install \
    && sudo python3 -m jupyter_polymake_wrapper.install \
    && cd /home/spp/jupyter_kernels

EXPOSE 8888

CMD /bin/bash -c "sudo ipython notebook --no-browser"