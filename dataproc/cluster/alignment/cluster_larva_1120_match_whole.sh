#!/bin/bash

# Designed for 24 slots on the LMB cluster

~/alignment/Fiji.app/ImageJ-linux64 -XX:ActiveProcessorCount=12 -Xms63g -Xmx63g -- --ij2 --headless --run ~/alignment/acardona-scripts/python/imagej/FIBSEM/serial_section_registration_1085.py 'SOURCE_DIR="/beegfs3/achampion/FIBSEM_L1120_FullCNS_8x8x8nm/",TARGET_DIR="/beegfs3/achampion/alignment/output/1120/v0/",ENSURE_MATCHES=true,ALIGN=false,EXIT=true,CHUNK_COUNT=24,CHUNK_LIMIT=1,CHUNK_START='$1

