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
    && mkdir /work/stream \
    && mkdir /work/fio \
    && mkdir /work/jobs

ADD Makefile /work/
ADD run.sh /work/
ADD run_small.sh /work/
ADD himeno/* /work/himeno/
ADD stream/* /work/stream/
ADD fio/* /work/fio/
ADD https://www.cs.virginia.edu/stream/FTP/Code/stream.c /work/stream/
ADD https://www.cs.virginia.edu/stream/FTP/Code/Versions/stream_mpi.c /work/stream/
ADD jobs/* /work/jobs/

RUN chown -R bench /work

USER bench
WORKDIR /work
RUN make \
    && chmod +x run.sh \
    && chmod +x run_small.sh


#CMD ./bmt_L_1x1x1.out
