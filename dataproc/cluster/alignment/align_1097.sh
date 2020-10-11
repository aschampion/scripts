#!/bin/bash

# Designed for 24 slots 

~/alignment/Fiji.app/ImageJ-linux64 -Xms116g -Xmx116g -- --ij2 --headless --console --run ~/alignment/acardona-scripts/python/imagej/FIBSEM/serial_section_registration_1085.py 'SOURCE_DIR="/groups/cardona/cardonalab/FIBSEM_L1097/",TARGET_DIR="/groups/cardona/cardonalab/Andrew/FIBSEM_L1097/",ENSURE_MATCHES=false,ALIGN=true,EXIT=true,CHUNK_COUNT=400,CHUNK_START=0,CHUNK_LIMIT=400'

