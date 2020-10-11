#!/bin/bash

# Designed for 6 slows 

~/alignment/Fiji.app/ImageJ-linux64 -Xms86g -Xmx86g -- --ij2 --headless --run ~/alignment/acardona-scripts/python/imagej/FIBSEM/serial_section_registration_1085.py 'ENSURE_MATCHES=false,ALIGN=false,EXPORT_N5=true,EXIT=true,CHUNK_COUNT=545,CHUNK_START=168,CHUNK_LIMIT=22,N5_SLAB='$1

