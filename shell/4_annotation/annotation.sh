#!/bin/bash

# parameter
indir=$1	# input direactory: /home/GT20286/wgs_project/output
outname=$2	# outname: YP,BLD...

# conda environment
conda activate wgs

# use VEP to annotate
cd $1/$2/gatk
vep --biotype --buffer_size 500 --check_existing --distance 5000 --numbers --regulatory --sift b --species mus_musculus --symbol --transcript_version --tsl --cache --input_file ${outname}.filter.vcf.gz --output_file $2

# quit conda environment
conda deactivate

