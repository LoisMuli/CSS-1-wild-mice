#!/bin/bash

# parameter
indir=$1	# input directory: /home/GT20286/wgs_project/output
outdir=$2	# output directory:/home/GT20286/wgs_project/genotyping
chr=$3		# chromosome that want to generate panel

#output directory 无文件夹就新建
if [ ! -d $2/chr${chr}/pass ]
then mkdir -p $2/chr${chr}/pass
fi

if [ ! -d $2/chr${chr}/top50 ]
then mkdir -p $2/chr${chr}/top50
fi

# conda environment
conda activate wgs

# select SNPs passed hard filtration
for line in $(ls $1);
do
zcat $1/${line}/gatk/${line}.filter.vcf.gz |java -jar /home/GT20286/miniconda3/envs/wgs/share/snpsift-5.1-0/SnpSift.jar filter "(FILTER = 'PASS')&(CHROM = '$3')" > $2/chr${chr}/pass/${line}_chr${chr}.pass.vcf
done

# merge strain and select unique homozygous SNPs
ls $2/chr${chr}/pass > $2/chr${chr}/pass/merge.list
bcftools merge -0 -Oz -o $2/chr${chr}/pass/merge_chr${chr}.vcf.gz -l $2/chr${chr}/pass/merge.list && \
zcat $2/chr${chr}/pass/merge_chr${chr}.vcf.gz |java -jar /home/GT20286/miniconda3/envs/wgs/share/snpsift-5.1-0/SnpSift.jar filter "(AC = 2)" > $2/pass/merge_chr${chr}_AC2.vcf && \
rm -rf $2/chr${chr}/pass/merge.list $2/chr${chr}/pass/merge_chr${chr}.vcf.gz

# seperate strain and select top 50 loci
for line in $(ls $1);
do
bcftools view -s ${line} $2/chr${chr}/pass/merge_AC2.vcf -Oz -o $2/chr${chr}/top50/${line}_chr${chr}_sep.vcf.gz
zcat $2/chr${chr}/top50/${line}_chr${chr}_sep.vcf.gz |java -jar /home/GT20286/miniconda3/envs/wgs/share/snpsift-5.1-0/SnpSift.jar filter "(AC=2)" > $2/chr${chr}/top50/${line}_chr${chr}_hom.vcf
bcftools filter $2/chr${chr}/top50/${line}_chr${chr}_hom.vcf -i 'INFO/DP>40' -Oz -o $2/chr${chr}/top50/${line}_chr${chr}_dp40.vcf
zcat $2/chr${chr}/top50/${line}_chr${chr}_dp40.vcf |grep -v '#' |awk '{print $8}'|awk -F "QD=" '{print $2}'|cut -d ";" -f 1 |sort|tail -n 50 > $2/chr${chr}/top50/${line}_chr${chr}.qd.stat
	head -n 1 $2/chr${chr}/top50/${line}_chr${chr}.qd.stat |while read qd
	do
	bcftools filter $2/chr${chr}/top50/${line}_chr${chr}_dp40.vcf -i "QD>$qd" -Oz -o $2/chr${chr}/top50/${line}_chr${chr}_top50.vcf.gz
	done
cd $2/chr${chr}/top50
vep --biotype --buffer_size 500 --check_existing --distance 5000 --numbers --regulatory --sift b --species mus_musculus --symbol --transcript_version --tsl --cache --input_file ${line}_chr${chr}_top50.vcf.gz --output_file ${line}_chr${chr}_top50
rm -rf $2/chr${chr}/top50/${line}_chr${chr}_sep.vcf.gz $2/chr${chr}/top50/${line}_chr${chr}_hom.vcf $2//chr${chr}top50/${line}_chr${chr}_dp40.vcf $2/chr${chr}/top50/${line}_chr${chr}.qd.stat
done

# quit conda environment
conda deactivate

