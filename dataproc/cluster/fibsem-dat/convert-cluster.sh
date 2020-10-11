#!/usr/bin/env bash
#$ -t 1-1000
#$ -tc 200

~/code/fibsem-dat/convert-wrapper.sh '$SGE_TASK_ID'
