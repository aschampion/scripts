#!/bin/bash

# Designed for 24 slots

~/janeliahome/alignment/Fiji.app/ImageJ-linux64 -Xms2g -Xmx2g -- --ij2 --headless --console --run ~/code/fibsem-dat/merlin-dat-to-tiff.groovy 'datFile="'$1'"'

