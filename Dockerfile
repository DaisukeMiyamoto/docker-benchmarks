FROM ubuntu:16.04

MAINTAINER Daisuke Miyamoto <miyamoto@brain.imi.i.u-tokyo.ac.jp>

ARG CFLAGS="-O3"
ARG CXXFLAGS="-O3"

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
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoclean


RUN useradd bench

RUN mkdir /work \
    && mkdir /work/himeno \
    && mkdir /work/jobs \
    && chown -R bench /work

USER bench
ADD Makefile /work/
ADD run.sh /work/
ADD himeno/* /work/himeno/
ADD jobs/* /work/jobs/


WORKDIR /work
RUN make \
    && chmod +x run.sh


#CMD ./bmt_L_1x1x1.out
