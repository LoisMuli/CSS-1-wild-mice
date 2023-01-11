#!/usr/bin/bash

# Hard Filtration

## parameters
input=$1 # input file
name=$2 # output name
outdir=$3 # output path

# Select SNP

gatk SelectVariants \
-select-type SNP \
-V $1 \
-O $3/${name}.snp.vcf.gz

# Filter SNP

gatk VariantFiltration \
-V $3/${name}.snp.vcf.gz \
--filter-expression "QD < 2.00" --filter-name "QD2" \
--filter-expression "FS > 60.000" --filter-name "FS60" \
--filter-expression "MQ < 40.00" --filter-name "MQ40" \
--filter-expression "SOR > 3.000" --filter-name "SOR3" \
--filter-expression "MQRankSum < -12.500" --filter-name "MQRankSum-12.5" \
--filter-expression "ReadPosRankSum < -8.000" --filter-name "ReadPosRankSum-8.0" \
-O $3/${name}.filter.snp.vcf
