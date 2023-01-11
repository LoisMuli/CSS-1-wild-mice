#!/usr/bin/bash

# path
reference=/home/GT20286/reference/reference_C57B6J
gatk_bundle=/home/GT20286/reference/gatk_bundle/b6/snps

##parameters
inpdir=$1 #input path
outdir=$2 # output path

#output directory
if [ ! -d $outdir/gatk ]
then mkdir -p $outdir/gatk
fi

# haplotype caller
ls $inpdir/*.sorted.markdup.bam | cut -d"/" -f 7 | cut -d"." -f 1 | while read id
do
gatk HaplotypeCaller \
-R $reference/Mus_musculus.GRCm39.dna.toplevel.fa \
-I $1/${id}.sorted.markdup.bam \
-O $2/gatk/${id}.hc.vcf.gz
done
