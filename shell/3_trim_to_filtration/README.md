# single strain from trimmomatic to annotation result

## automated process
	Run 'bash 0_run_all.sh input indir outdir outname'

## step by step process
	# quality control
	Run 'bash 1_trim.sh input indir outdir outname'
	# alignment
	Run 'bash 2_bwa+markdup.sh input indir outdir outname'
	# variant filtration
	Run 'bash 3_variant_call.sh input indir outdir outname'

# parameter
	input=$1	#name of the input file: SRRXXXX
	indir=$2	#input directory: ~/wgs_project/rawdata/fastq
	outdir=$3	#out directory: ~/wgs_project/output
	outname=$4	#outfile name: YP/BLD/DX...


# example result
	input file number: SRR3438462
	outfile name: YP
## input rawdata
	~/wgs_project/rawdata/fastq/SRR3438462_1.fastq.gz ~/wgs_project/rawdata/fastq/SRR3438462_1.fastq.gz
## 1_trim.sh output
	YP_1.clean.fastq.gz YP_2.clean.fastq.gz
## 2_bwa+markdup.sh
	YP.sorted.markdup.bam
## 3_variant_call.sh
	YP.filter.snp.vcf


# software used in shell

## 1_trim.sh
### trimmomatic			quality control
	java -jar /home/GT20286/software/Trimmomatic-0.39/trimmomatic-0.39.jar PE input_1.fastq.gz input_2.fastq.gz \
	outname_1.clean.fastq.gz outname_1.unpaired.fastq.gz \
	outname_2.clean.fastq.gz outname_2.unpaired.fastq.gz \
	ILLUMINACLIP:/home/GT20286/software/Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:8:True \
	SLIDINGWINDOW:5:20 LEADING:3 TRAILING:3 MINLEN:50

## 2_bwa+markdup.sh
### bwa				alignment reads
	bwa mem -t 30 -M -Y -R "@RG\tID:$1\tPL:ILLUMINA\tLB:$library\tSM:$4" $reference/Mus_musculus.GRCm39.dna.toplevel.fa \
	$outdir/trim/${outname}_1.clean.fastq.gz $outdir/trim/${outname}_2.clean.fastq.gz | samtools view -Sb - > $outdir/${outname}.bam
### samtools sort		sort reads to performe subsequent process
	samtools sort -@ 10 -m 10G -O bam -o $outdir/${outname}.sorted.bam $outdir/${outname}.bam
### gatk Markduplicates		去重复序列
	gatk MarkDuplicates -I $outdir/${outname}.sorted.bam -O $outdir/${outname}.sorted.markdup.bam -M $outdir/${outname}.sorted.markdup_metrics.txt
### samtools index		save time for running
	samtools index $outdir/${outname}.sorted.markdup.bam

## 3_variant_call.sh
### gatk HaplotypeCaller		
	gatk HaplotypeCaller -R $reference/Mus_musculus.GRCm39.dna.toplevel.fa \
	-I $3/$4/bwa/${outname}.sorted.markdup.bam \
	-O $3/$4/gatk/${outname}.hc.vcf.gz
### hard filtration
	gatk SelectVariants -select-type SNP -V $3/$4/gatk/${outname}.hc.vcf.gz -O $3/$4/gatk/${outname}.snp.vcf.gz
	gatk VariantFiltration -V $3/$4/gatk/${outname}.snp.vcf.gz \
	--filter-expression "QD < 2.00" --filter-name "QD2" \
	--filter-expression "FS > 60.000" --filter-name "FS60" \
	--filter-expression "MQ < 40.00" --filter-name "MQ40" \
	--filter-expression "SOR > 3.000" --filter-name "SOR3" \
	--filter-expression "MQRankSum < -12.500" --filter-name "MQRankSum-12.5" \
	--filter-expression "ReadPosRankSum < -8.000" --filter-name "ReadPosRankSum-8.0" \
	-O $3/$4/gatk/${outname}.filter.snp.vcf

