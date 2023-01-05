#!/usr/bin/bash

reference=/home/GT20286/reference/reference_C57B6J
gatk_bundle=/home/GT20286/reference/gatk_bundle/b6/snps

##shell执行参数
inpdir=$1 #输入文件路径
outdir=$2 #输出文件的路径

#output diretory 无文件夹就新建
if [ ! -d $outdir/gatk ]
then mkdir -p $outdir/gatk
fi

# 变异检测
ls $inpdir/*.sorted.markdup.bam | cut -d"/" -f 7 | cut -d"." -f 1 | while read id
do
gatk HaplotypeCaller \
-R $reference/Mus_musculus.GRCm39.dna.toplevel.fa \
-I $1/${id}.sorted.markdup.bam \
-O $2/gatk/${id}.hc.vcf.gz
done

