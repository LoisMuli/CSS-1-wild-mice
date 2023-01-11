#!/usr/bin/bash

# parameter
input=$1	#name of the input file: {input}_1.fastq.gz
indir=$2	#input directory: ~/wgs_project/rawdata/fastq
outdir=$3	#out directory: ~/wgs_project/output
outname=$4	#outfile name: YP/BLD/DX...

# output directory 无文件夹就新建
if [ ! -d $3/$4/fastqc ]
then mkdir -p $3/$4/fastqc
fi

# fastqc
fastqc -t 8 -o $3/$4/fastqc $2/${input}_*

