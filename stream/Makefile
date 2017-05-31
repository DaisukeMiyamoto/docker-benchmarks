#Makefile

CONDITION = -DSTREAM_ARRAY_SIZE=80000000 -DNTIMES=20
CONDITION_MPI = -DSTREAM_ARRAY_SIZE=160000000 -DNTIMES=20

CC = mpicc
CFLAGS = -O3
ICC_CFLAGS = -O3 -xCORE-AVX2 -ffreestanding -qopenmp

all: stream.out stream_mpi.out

stream.out: stream.c
    wget https://www.cs.virginia.edu/stream/FTP/Code/stream.c
	${CC} ${CFLAGS} ${CONDITION} $^ -o $@

stream_mpi.out: stream_mpi.c
    wget https://www.cs.virginia.edu/stream/FTP/Code/Versions/stream_mpi.c
	${CC} ${CFLAGS} ${CONDITION_MPI} $^ -o $@

stream.c:

stream_mpi.c:

clean:
	rm -f *.out *.o
