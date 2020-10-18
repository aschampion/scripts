#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

find $3 -maxdepth 1 -type f -name '*.dat' | sort | head -$(expr $1 + $2) | tail -$2 | xargs -n 1 $DIR/convert.sh

