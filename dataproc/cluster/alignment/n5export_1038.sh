#!/bin/bash

# Designed for 6 slows 

~/alignment/Fiji.app/ImageJ-linux64 -Xms86g -Xmx86g -- --ij2 --headless --run ~/alignment/acardona-scripts/python/imagej/FIBSEM/serial_section_registration_1085.py 'SOURCE_DIR="/nrs/cardona/FIBSEM/Larva1038/",TARGET_DIR="/groups/cardona/cardonalab/Andrew/FIBSEM_L1038/",ENSURE_MATCHES=false,ALIGN=false,EXPORT_N5=true,EXIT=true,CHUNK_COUNT=435,CHUNK_START=0,CHUNK_LIMIT=435,N5_SLAB='$1

