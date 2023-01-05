#!usr/bin/bash

#参数
samplename=$1
splitfile=$2
outdir=$3

#output diretory 无文件夹就新建
if [ ! -d $outdir/si${samplename} ]
then mkdir -p $outdir/si${samplename}
fi

#
bcftools view -s $1 $2 -Oz -o $outdir/si${samplename}/${samplename}.vcf.gz

zcat $outdir/si${samplename}/${samplename}.vcf.gz |java -jar /home/GT20286/miniconda3/envs/wgs/share/snpsift-5.1-0/SnpSift.jar filter "(AC=2)" > $outdir/si${samplename}/${samplename}_hom.vcf

bcftools filter $outdir/si${samplename}/${samplename}_hom.vcf -i 'INFO/DP>40' -o $outdir/si${samplename}/${samplename}_dp40.vcf

cat $outdir/si${samplename}/${samplename}_dp40.vcf |grep -v '#' |awk '{print $8}'|awk -F "QD=" '{print $2}'|cut -d ";" -f 1 |sort|tail -n 50 > $outdir/si${samplename}/${samplename}.qd.stat

head -n 1 $outdir/si${samplename}/${samplename}.qd.stat| while read qd
do
bcftools filter $outdir/si${samplename}/${samplename}_dp40.vcf -i "QD>$qd" -o $outdir/si${samplename}/${samplename}_top50.vcf
done

