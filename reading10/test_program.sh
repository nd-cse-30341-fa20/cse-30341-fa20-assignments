#!/bin/bash

output() {
    cat <<EOF | base64 -d
L2Rldi9tZDEyNgpleHQ0CnJhaWQxCjMyRwo3ODY0MzUzCjExNzY4MAo=
EOF
}

printf "Testing reading10 program ... "

DIFF=$(diff <(./program 2> /dev/null) <(output) | grep -E "^[><]" | wc -l)
SCORE=$(python3 <<EOF
print("{:0.2f}".format((6 - $DIFF) * 3.0 / 6.0))
EOF
)
if [ "$DIFF" -eq 0 ]; then
    echo "Success"
else
    echo "Failure"
fi

echo "   Score $SCORE"
exit $DIFF
