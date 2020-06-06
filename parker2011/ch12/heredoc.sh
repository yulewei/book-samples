#!/bin/bash
HOST=$1
shift
PORT=80
COMMAND=${@:-HEAD /}

echo "Sending \"$COMMAND\" to $HOST port $PORT"
netcat ${HOST} ${PORT} <<EOF
${COMMAND}

EOF
echo "Done!"
