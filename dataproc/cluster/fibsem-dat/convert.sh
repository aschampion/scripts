#!/bin/bash

# Designed for 24 slots

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

~/janeliahome/alignment/Fiji.app/ImageJ-linux64 -Xms2g -Xmx2g -- --ij2 --headless --console --run $DIR/merlin-dat-to-tiff.groovy 'datFile="'$1'"'

