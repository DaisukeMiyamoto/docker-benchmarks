#!/bin/bash

PROC=4
mpirun -np ${PROC} ./stream/stream_mpi.out
