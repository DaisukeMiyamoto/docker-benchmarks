#!/bin/bash

PROC=8

mpirun -np ${PROC} ./himeno/bmt_L_2x2x2.out
