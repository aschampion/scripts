#!/bin/bash

# Designed for 24 slots on the LMB cluster

~/alignment/Fiji.app/ImageJ-linux64 -XX:ActiveProcessorCount=12 -Xms63g -Xmx63g -- --ij2 --headless --run ~/alignment/acardona-scripts/python/imagej/FIBSEM/serial_section_registration_1085.py 'SOURCE_DIR="/beegfs3/achampion/FIBSEM_L1123_FullCNS_12x12x12nm/",TARGET_DIR="/beegfs3/achampion/alignment/output/1123/v1/",ENSURE_MATCHES=true,ALIGN=false,EXIT=true,CHUNK_COUNT=22,CHUNK_LIMIT=1,CHUNK_START='$1

