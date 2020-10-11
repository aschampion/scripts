#!/bin/bash

# Designed for 6 slows 

~/alignment/Fiji.app/ImageJ-linux64 -Xms86g -Xmx86g -- --ij2 --headless --run ~/alignment/acardona-scripts/python/imagej/FIBSEM/serial_section_registration_1085.py 'SOURCE_DIR="/groups/cardona/cardonalab/FIBSEM_L1097/",TARGET_DIR="/groups/cardona/cardonalab/Andrew/FIBSEM_L1097/",ENSURE_MATCHES=false,ALIGN=false,EXPORT_N5=true,EXIT=true,CHUNK_COUNT=400,CHUNK_START=0,CHUNK_LIMIT=400,ROTATE_EXPORT=true,N5_SLAB='$1

