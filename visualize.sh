#!/bin/bash
# Ivokes the measurement visualization R script.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if ls *dat &> /dev/null;
then
  R -q < $DIR/perf.r  --no-save
else
  echo "Please generate the .dat files with measure.sh first"
fi
