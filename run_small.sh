#!/bin/bash

VERSION=0.3s
FILENAME="$(hostname -s)_ver${VERSION}.log"

JOBS=(
    "himeno_local_M_single.sh"
    "stream_local_single.sh"
)
FILTER=(
    "grep measured"
    "grep -A 4 Function"
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

