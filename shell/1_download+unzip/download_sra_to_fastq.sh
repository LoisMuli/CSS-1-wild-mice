#!/bin/bash

#output directory 无文件夹就新建
outdir=$3	# out directory: ~/wgs_project/rawdata
if [ ! -d $3/sra ]
then mkdir -p $3/sra
fi

if [ ! -d $3/fastq ]
then mkdir -p $3/fastq
fi

if [ $1 = "h" ] # help
then
echo "usage: download_sra_to_fastq.sh h|s|l input_data/file out_directory"
echo "h (help): print this message"
echo "s (single data): input_data:SRRXXXX  out_directory: ~/wgs_project/rawdata"
echo "l (data list): input_file:SRR_Acc_List.txt  out_directory: ~/wgs_project/rawdata"

elif [ $1 = "s" ]
then
input=$2	# project number: SRRXXXX
prefetch --max-size 100G $2 -O $3/sra/ \
&& echo "**SRA to fastq.gz start**" && \
fastq-dump --gzip --split-3 $2 -O $3/fastq/

elif [ $1 = "l" ]
then
input=$2	# number list
prefetch --max-size 100G $2 -O $3/sra/ \
&& echo "**SRA to fastq.gz start**" && \
for id in $(cat ./sra/$2);
do
fastq-dump --gzip --split-3 $id -O $3/fastq/
done

else
echo "Try 'download_sra_to_fastq.sh h' for more information"
fi
