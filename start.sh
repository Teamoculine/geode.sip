#!/bin/sh

# Start dummy HTTP server in background
python3 -m http.server ${PORT:-8080} &

# Start Asterisk in foreground
asterisk -f -vvvg
