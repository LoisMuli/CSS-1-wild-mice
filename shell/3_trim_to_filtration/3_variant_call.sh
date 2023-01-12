#!/usr/bin/bash

# refernce path
reference=/home/GT20286/reference/reference_C57B6J
gatk_bundle=/home/GT20286/reference/gatk_bundle/b6/snps

# parameter
input=$1	#name of the input file: {input}_1.fastq.gz
indir=$2	#input directory: ~/wgs_project/rawdata/fastq
outdir=$3	#out directory: ~/wgs_project/output
outname=$4	#outfile name: YP/BLD/DX...

#output directory 无文件夹就新建
if [ ! -d $3/$4/gatk ]
then mkdir -p $3/$4/gatk
fi

# variant calling
gatk HaplotypeCaller \
-R $reference/Mus_musculus.GRCm39.dna.toplevel.fa \
-I $3/$4/bwa/${outname}.sorted.markdup.bam \
-O $3/$4/gatk/${outname}.hc.vcf.gz

# hard filtration
## select SNP
gatk SelectVariants \
-select-type SNP \
-V $3/$4/gatk/${outname}.hc.vcf.gz \
-O $3/$4/gatk/${outname}.snp.vcf.gz

## Filter SNP
gatk VariantFiltration \
-V $3/$4/gatk/${outname}.snp.vcf.gz \
--filter-expression "QD < 2.00" --filter-name "QD2" \
--filter-expression "FS > 60.000" --filter-name "FS60" \
--filter-expression "MQ < 40.00" --filter-name "MQ40" \
--filter-expression "SOR > 3.000" --filter-name "SOR3" \
--filter-expression "MQRankSum < -12.500" --filter-name "MQRankSum-12.5" \
--filter-expression "ReadPosRankSum < -8.000" --filter-name "ReadPosRankSum-8.0" \
-O $3/$4/gatk/${outname}.filter.vcf.gz

## select PASS SNP
conda activate wgs
bcftools filter $3/$4/gatk/${outname}.filter.vcf.gz -i 'FILTER="PASS"' -Oz -o $3/$4/gatk/${outname}.pass.vcf.gz
conda deactiate

# delete useless file
rm -rf $3/$4/gatk/${outname}.snp.vcf.gz $3/$4/gatk/${outname}.hc.vcf.gz $3/$4/gatk/${outname}.filter.vcf.gz && \
echo "** variant calling done **"

