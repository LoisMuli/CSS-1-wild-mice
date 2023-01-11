#!/usr/bin/bash

# software path
trimmomatic=/home/GT20286/software/Trimmomatic-0.39/trimmomatic-0.39.jar

# parameter
input=$1	#name of the input file: {input}_1.fastq.gz
indir=$2	#input directory: ~/wgs_project/rawdata/fastq
outdir=$3	#out directory: ~/wgs_project/output
outname=$4	#outfile name: YP/BLD/DX...

#output directory 无文件夹就新建
if [ ! -d $3/$4/trim ]
then mkdir -p $3/$4/trim
fi

##Trimmomatic质控
time java -jar ${trimmomatic} PE \
$2/${input}_1.fastq.gz $2/${input}_2.fastq.gz \
$3/$4/trim/${outname}_1.clean.fastq.gz $3/$4/trim/${outname}_1.unpaired.fastq.gz \
$3/$4/trim/${outname}_2.clean.fastq.gz $3/$4/trim/${outname}_2.unpaired.fastq.gz \
ILLUMINACLIP:/home/GT20286/software/Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:8:True \
SLIDINGWINDOW:5:20 LEADING:3 TRAILING:3 MINLEN:50 && \
rm -rf $3/$4/trim/${outname}_1.unpaired.fastq.gz $3/$4/trim/${outname}_2.unpaired.fastq.gz && \
echo "** trimmomatic done **"

