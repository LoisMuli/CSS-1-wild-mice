#!/usr/bin/bash

# reference
reference=/home/GT20286/reference/reference_C57B6J

# parameter
input=$1	#name of the input file: SRRXXXX
indir=$2	#input directory: ~/wgs_project/rawdata/fastq
outdir=$3	#out directory: ~/wgs_project/output
outname=$4	#outfile name: YP/BLD/DX...

# output directory 无文件夹就新建
if [ ! -d $3/$4/bwa ]
then mkdir -p $3/$4/bwa
fi

## bwa比对
bwa mem -t 30 -M -Y -R "@RG\tID:$1\tPL:ILLUMINA\tLB:$library\tSM:$4" $reference/Mus_musculus.GRCm39.dna.toplevel.fa \
$outdir/trim/${outname}_1.clean.fastq.gz $outdir/trim/${outname}_2.clean.fastq.gz | samtools view -Sb - > $3/$4/bwa/${outname}.bam && echo "** bwa mem done **" && \
samtools sort -@ 10 -m 10G -O bam -o $3/$4/bwa/${outname}.sorted.bam $3/$4/bwa/${outname}.bam && echo "** sort rawbam done **" &&

## gatk Markduplicates去重复序列
gatk MarkDuplicates -I $3/$4/bwa/${outname}.sorted.bam -O $3/$4/bwa/${outname}.sorted.markdup.bam -M $3/$4/bwa/${outname}.sorted.markdup_metrics.txt && \
echo "** MarkDup done **" &&

## samtools 构建index
samtools index $3/$4/bwa/${outname}.sorted.markdup.bam && echo "** sample samtools index done **" &&

## delete useless file
rm -rf $3/$4/bwa/${outname}.sorted.markdup_metrics.txt $3/$4/bwa/${outname}.sorted.bam $3/$4/bwa/${outname}.bam && echo "** bwa+markdup done **"

