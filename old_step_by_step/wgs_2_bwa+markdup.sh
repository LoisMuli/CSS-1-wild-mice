#!/usr/bin/bash

# reference path
reference=/home/GT20286/reference/reference_C57B6J

## parameters
fq1=$1
fq2=$2
RGID=$3 # output file name
library=$4 # squencing library
SM=$5 # sample name 
outdir=$6 # output path


##bwa
time bwa mem -t 30 -M -Y -R "@RG\tID:$RGID\tPL:ILLUMINA\tLB:$library\tSM:$SM" $reference/Mus_musculus.GRCm39.dna.toplevel.fa \
$1 $2 | samtools view -Sb - > $outdir/${RGID}.bam && echo "** bwa mem done **" && \
time samtools sort -@ 10 -m 10G -O bam -o $outdir/${RGID}.sorted.bam $outdir/${RGID}.bam && echo "** sort rawbam done **" &&

##gatk Markduplicates
gatk MarkDuplicates -I $outdir/${RGID}.sorted.bam -O $outdir/${RGID}.sorted.markdup.bam -M $outdir/${RGID}.sorted.markdup_metrics.txt && echo "** ${RGID} MarkDup done **" &&

##samtools    build index
time samtools index $outdir/${RGID}.sorted.markdup.bam && echo "** ${RGID}.sorted.markdup.bam index done **"
