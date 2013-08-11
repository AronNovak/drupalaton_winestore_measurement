#!/bin/bash
# Ivokes the measurement visualization R script.
if ls *dat &> /dev/null;
then
  R -q < perf.r  --no-save
else
  echo "Please generate the .dat files with measure.sh first"
fi
