#!/bin/bash

# Designed for 8 slots

~/alignment/Fiji.app/ImageJ-linux64 -Xms116g -Xmx116g -- --ij2 --headless --run ~/alignment/acardona-scripts/python/imagej/FIBSEM/serial_section_registration_1085.py 'ENSURE_MATCHES=true,ALIGN=false,EXIT=true,CHUNK_COUNT=545,CHUNK_LIMIT=1,CHUNK_START='$1

