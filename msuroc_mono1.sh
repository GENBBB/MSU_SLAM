#!/bin/bash
pathDatasetEuroc='/home/gen/datasets/msuroc_slam'

echo "Launching msuroc with Monocular sensor cam0"
./Examples/Monocular/mono_msuroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/msuroc1.yaml "$pathDatasetEuroc"/seq1/mav0/cam1/data "$pathDatasetEuroc"/seq1/mav0/cam1/times.txt dataset-msuroc-mono-1