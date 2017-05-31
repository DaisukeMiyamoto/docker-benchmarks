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

RUN useradd bench\
    && mkdir /work
#    && mkdir /work/himeno \
#    && mkdir /work/stream \
#    && mkdir /work/fio \
#    && mkdir /work/jobs

COPY Makefile /work/
COPY run.sh /work/
COPY run_small.sh /work/
COPY himeno /work/himeno
COPY stream /work/stream
COPY fio /work/fio
COPY unixbench /work/unixbench
#ADD https://www.cs.virginia.edu/stream/FTP/Code/stream.c /work/stream/
#ADD https://www.cs.virginia.edu/stream/FTP/Code/Versions/stream_mpi.c /work/stream/
COPY jobs /work/jobs

RUN chown -R bench /work

USER bench
WORKDIR /work
RUN make \
    && chmod +x run.sh \
    && chmod +x run_small.sh


#CMD ./bmt_L_1x1x1.out
