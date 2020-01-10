#!/bin/bash

~/n5export/Fiji.app/ImageJ-linux64 -Xms96g -Xmx96g -- --ij2 --headless --run ~/n5export/trakem2-export/trakem2-export-volume-as-cubes.py 'THREADS=6,EXPORTER_STRATEGY="Slabs",TARGET_N5="/nrs/zlatic/championa/larva-1018.n5",TARGET_PROJECT="/groups/cardona/home/championa/n5export/affine_00000_07350_3adj_2k_0.8_roi_50mae_0.1mir_1.0tol_no_reg_7350_end_reg.xml",CHUNK_LIMIT_K=1,CHUNK_START_K='$1
