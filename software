# software and version used in this project

## download sra
	sratoolkit.3.0.0-ubuntu64
		prefetch
## unzip sra file
	sratoolkit.3.0.0-ubuntu64
		fastq-dump
## fastqc
	FastQC v0.11.9
		fastqc
## trimmomatic
	Trimmomatic-0.39
		java -jar /home/GT20286/software/Trimmomatic-0.39/trimmomatic-0.39.jar
## bwa
	bwa-0.7.17
		bwa mem
## sam to bam
	samtools 1.15.1
		samtools view
## sort reads
	samtools 1.15.1
		samtools sort
## mark duplicate
	Genome Analysis Toolkit (GATK) v4.2.6.1
		gatk MarkDuplicates
## build reads index
	samtools 1.15.1
		samtools index
## variant call
	Genome Analysis Toolkit (GATK) v4.2.6.1
		gatk HaplotypeCaller
## hard filtration
	Genome Analysis Toolkit (GATK) v4.2.6.1
		gatk SelectVariants
		gatk VariantFiltration
## annotation
	under conda environment (wgs)
	ENSEMBL VARIANT EFFECT PREDICTOR   ensembl-vep 108.1
		vep
## genotyping
	under conda environment (wgs)
	SnpSift version 5.1d
		java -jar /home/GT20286/miniconda3/envs/wgs/share/snpsift-5.1-0/SnpSift.jar filter
	bcftools 1.16
		bcftools merge
		bcftools view
		bcftools filter
	ENSEMBL VARIANT EFFECT PREDICTOR   ensembl-vep 108.1
                vep
## prediction
	all used basic command


