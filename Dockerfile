FROM python:slim AS builder

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
    pip wheel -w /root/pip-wheel \
              python-flint


FROM python:slim

COPY --from=builder \
     /root/pip-wheel/python_flint-0.3.0-cp311-cp311-linux_x86_64.whl \
     /root/pip-wheel/python_flint-0.3.0-cp311-cp311-linux_x86_64.whl

RUN apt update && \
    apt install -y \
                libgmp-dev \
                libflint-dev \
                libflint-arb-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pip install /root/pip-wheel/python_flint-0.3.0-cp311-cp311-linux_x86_64.whl
