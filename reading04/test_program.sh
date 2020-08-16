#!/bin/bash

output() {
    base64 -d \
	<<<cHliZnIgZXJucSBiY3JhCmJjcmEKYmNyYQpweWJhcgpweWJhcgpqbnZnNAo= | \
	tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

printf "Testing reading04 program ... "

DIFF=$(diff <(./program 2> /dev/null) <(output) | grep "^>" | wc -l)
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
