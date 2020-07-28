#!/bin/sh

for i in $(seq 1 12); do
    n=$(printf "%02d" $i)
    mkdir reading$n

    cat > reading$n/README.md <<EOF
# Reading $n
EOF
done

for p in $(seq 1 4); do
    n=$(printf "%02d" $p)
    mkdir project$n
    cat > project$n/README.md <<EOF
# Project $n
EOF
done
