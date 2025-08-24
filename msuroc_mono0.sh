#!/bin/bash
pathDatasetEuroc='/home/gen/datasets/msuroc_slam2'

echo "Launching msuroc with Monocular sensor cam0"
./Examples/Monocular/mono_msuroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular/msuroc0.yaml "$pathDatasetEuroc"/seq1/mav0/cam0/data "$pathDatasetEuroc"/seq1/mav0/cam0/times.txt dataset-msuroc-mono-0
