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
True
False
EOF
}

printf "Testing reading01 program ... "

DIFF=$(diff <(./program 2> /dev/null) <(output) | grep "^>" | wc -l)
SCORE=$(python3 <<EOF
print("{:0.2f}".format((10 - $DIFF) * 3.0 / 10.0))
EOF
)
if [ "$DIFF" -eq 0 ]; then
    echo "Success"
else
    echo "Failure"
fi

echo "   Score $SCORE"
exit $DIFF
