#!/usr/bin/bash

# parameter
input=$1	#name of the input file: SRRXXXX
indir=$2	#input directory: ~/wgs_project/rawdata/fastq
outdir=$3	#out directory: ~/wgs_project/output
outname=$4	#outfile name: YP/BLD/DX...

bash 1_trim.sh $1 $2 $3 $4 && \
bash 2_bwa+markdup.sh $1 $2 $3 $4 && \
bash 3_variant_call.sh $1 $2 $3 $4

