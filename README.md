# WGS pipeline

## fastqc
fastqc -o /path/to/fastqc -t 8 *.fastq.gz

## trimmmomatic
wgs_1_trim.sh

## bwa+markdup
wgs_2_bwa+markdup.sh

## hc
wgs_3_hc.sh

## hard filtration
wgs_4_hard_filtration.sh

# VEP
vep --biotype --buffer_size 500 --check_existing --distance 5000 --numbers --regulatory --sift b --species mus_musculus --symbol --transcript_version --tsl --cache --input_file [input_data] --output_file [output_file]

# Genotyping panel

## select top 50 variants
zcat line.filter.vcf.gz |java -jar /home/GT20286/miniconda3/envs/wgs/share/snpsift-5.1-0/SnpSift.jar filter "(FILTER = 'PASS')" > linepass.vcf
bcftools merge -0 -Oz -o output.vcf.gz -l inputfile.list
zcat output.vcf.gz |java -jar /home/GT20286/miniconda3/envs/wgs/share/snpsift-5.1-0/SnpSift.jar filter "(AC = 2)" > output_AC2.vcf
strain_select.sh

## select proper SNP loci
