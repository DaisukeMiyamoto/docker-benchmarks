FROM ubuntu:16.04

MAINTAINER Daisuke Miyamoto <miyamoto@brain.imi.i.u-tokyo.ac.jp>

ARG CFLAGS="-O3"
ARG CXXFLAGS="-O3"

RUN mkdir /work
WORKDIR /work
COPY himenoBMTxps.c /work
COPY Makefile /work

RUN apt-get update \
    && apt-get install -y \
        locales \
        wget \
        gcc \
        g++ \
        build-essential \
        openmpi-bin \
        openmpi-common \
        libopenmpi-dev \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && make \
    && apt-get purge -y --auto-remove \
        gcc \
        g++ \
        build-essential \
        libopenmpi-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoclean

CMD ./bmt_L_1x1x1.out
