#!/bin/bash
pathDatasetEuroc='/home/gen/datasets/msuroc_slam'

echo "Launching msuroc with Monocular-Inertial sensor with cam0 under GDB"
gdb --args ./Examples/Monocular-Inertial/mono_inertial_msuroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular-Inertial/msuroc0.yaml "$pathDatasetEuroc"/seq1/mav0/cam0/data "$pathDatasetEuroc"/seq1/mav0/cam0/times.txt dataset-msuroc_monoi