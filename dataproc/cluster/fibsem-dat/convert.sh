#!/bin/bash

# Designed for 2 slots

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

~/janeliahome/alignment/Fiji.app/ImageJ-linux64 -Xms5g -Xmx5g -- --ij2 --headless --console --run $DIR/merlin-dat-to-tiff.groovy 'datFile="'$1'"'

