#!/bin/bash
pathDatasetEuroc='/home/gen/datasets/msuroc_slam'

echo "Launching msuroc with stereo sensor"
./Examples/Stereo/stereo_euroc ./Vocabulary/ORBvoc.txt ./Examples/Stereo/msuroc.yaml "$pathDatasetEuroc"/seq1 "$pathDatasetEuroc"/seq1/mav0/cam0/times.txt "$pathDatasetEuroc"/seq1/mav0/cam1/times.txt dataset-msuroc_monoi