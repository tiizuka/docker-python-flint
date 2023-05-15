FROM python:slim

RUN apt update && \
    apt install -y \
                gcc \
                libgmp-dev \
                libflint-dev \
                libflint-arb-dev && \
    ln -s /usr/include/flint \
          /usr/local/include/flint && \
    ln -s /usr/lib/x86_64-linux-gnu/libflint-arb.so \
          /usr/lib/x86_64-linux-gnu/libarb.so && \
    pip install --no-cache-dir \
                cython \
                numpy && \
    pip install --no-cache-dir \
                python-flint
