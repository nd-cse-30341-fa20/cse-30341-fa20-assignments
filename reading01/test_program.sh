#!/bin/bash

output() {
    cat <<EOF
False
False
True
True
False
True
True
False
True
False
EOF
}

printf "Testing reading01 program ... "

DIFF=$(diff <(./program 2> /dev/null) <(output) | grep "^>" | wc -l)
SCORE=$(echo "scale=2; (10 - $DIFF) * 3.0 / 10.0" | bc)
if [ "$DIFF" -eq 0 ]; then
    echo "Success ($SCORE)"
    exit 0
else
    echo "Failure ($SCORE)"
    exit $DIFF
fi
