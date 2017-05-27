#!/bin/bash

PROC=4
mpirun -np ${PROC} ./himeno/bmt_L_2x2x1.out
