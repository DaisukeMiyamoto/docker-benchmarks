#!/bin/bash

VERSION=0.3
FILENAME="$(hostname -s)_ver${VERSION}.log"

JOBS=(
    "himeno_local_L_single.sh"
    "himeno_local_L_mpi4.sh"
    "himeno_local_L_mpi8.sh"
    "himeno_local_XL_mpi8.sh"
    "stream_local_single.sh"
    "stream_local_mpi4.sh"
    "fio_tmp.sh"
    "fio_work.sh"
#    "hpl_local.sh"
)
FILTER=(
    "grep measured"
    "grep measured"
    "grep measured"
    "grep measured"
    "grep -A 4 Function"
    "grep -A 4 Function"
    "grep -A 1 jobs="
    "grep -A 1 jobs="
#    "grep -A 17 Summary"
)

TEE="tee -a ${FILENAME}"

echo "" > ${FILENAME}
echo "# $(hostname)" | ${TEE}
echo "- regulation ver ${VERSION}" | ${TEE}
echo "- $(date +%Y%m%d_%H%M%S)" | ${TEE}
echo "" | ${TEE}

LAST=`expr ${#JOBS[@]} - 1`
for i in `seq 0 ${LAST}`; do
    echo "## "${JOBS[i]} | ${TEE}
    echo "\`\`\`" | ${TEE}
    ./jobs/${JOBS[i]} | ${FILTER[i]} | ${TEE}
    echo "\`\`\`" | ${TEE}
    echo "" | ${TEE}
done

