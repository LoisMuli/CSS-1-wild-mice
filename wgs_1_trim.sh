#!/usr/bin/bash

# software path
trimmomatic=/home/GT20286/software/Trimmomatic-0.39/trimmomatic-0.39.jar

## parameters
fq1=$1
fq2=$2
outdir=$3 # output path, better named the same as sample name
RGID=$4 # output name

#output directory
if [ ! -d $outdir/trim ]
then mkdir -p $outdir/trim
fi

##Trimmomatic
time java -jar ${trimmomatic} PE \
$fq1 $fq2 \
$outdir/trim/${RGID}_1.clean.fastq.gz $outdir/trim/${RGID}_1.unpaired.fastq.gz \
$outdir/trim/${RGID}_2.clean.fastq.gz $outdir/trim/${RGID}_2.unpaired.fastq.gz \
ILLUMINACLIP:/home/GT20286/software/Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:8:True \
SLIDINGWINDOW:5:20 LEADING:3 TRAILING:3 MINLEN:50 && echo "** trimmomatic done **"
