#!/usr/bin/env bash

find /beegfs3/achampion/FIBSEM_L1126_FullCNS_12x12x12nm/ -maxdepth 1 -type f -name '*.dat' | sort | head -$(expr $1 + $2) | tail -$2 | xargs -n 1 ~/code/fibsem-dat/convert.sh

