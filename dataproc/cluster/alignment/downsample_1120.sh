#!/usr/bin/env bash

SPARK_JANELIA=/lmb/home/achampion/code/spark-janelia/spark-janelia N_EXECUTORS_PER_NODE=6 N_CORES_PER_EXECUTOR=4 MEMORY_PER_NODE=64 ~/code/java/n5-spark/startup-scripts/spark-janelia/n5-scale-pyramid.py 24 -n /beegfs3/achampion/alignment/output/1120/v0/n5 -i /FIBSEM_L1120_FullCNS_8x8x8nm/s0 -f 2,2,2
