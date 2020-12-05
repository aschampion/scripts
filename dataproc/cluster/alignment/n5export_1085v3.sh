#!/bin/bash

# Designed for 24 slots on the LMB cluster

~/alignment/Fiji.app/ImageJ-linux64 -XX:ActiveProcessorCount=24 -Xms62g -Xmx62g -- --ij2 --headless --run ~/alignment/acardona-scripts/python/imagej/FIBSEM/serial_section_registration_1085.py 'SOURCE_DIR="/beegfs3/achampion/FIBSEM_L1085/",TARGET_DIR="/beegfs3/achampion/alignment/output/1085/v3/",ENSURE_MATCHES=false,ALIGN=false,EXPORT_N5=true,ROTATE_EXPORT=true,EXIT=true,CHUNK_COUNT=400,CHUNK_LIMIT=400,CHUNK_START=0,N5_SLAB='$1

