# Shell procedures


## 1_download+unzip
### shell order
	bash /home/GT20286/wgs_project/shell/1_download+unzip/download_sra_to_fastq.sh h|s|l input_data/file out_directory

	# help
	Try 'bash /home/GT20286/wgs_project/shell/1_download+unzip/download_sra_to_fastq.sh h' for help

### example result
	sra/SRR3438462		fastq/YP_1.fastq.gz YP_2.fastq.gz

## 2_fastqc
### shell order
	bash /home/GT20286/wgs_project/shell/2_fastqc/fastqc.sh input indir outdir outname

	# help
	input: name of the input file (SRRXXXX)
	indir: input directory (~/wgs_project/rawdata/fastq)
	outdir: out directory (~/wgs_project/output)
	outname: outfile name (YP/BLD/DX...)

### example result
	# input
		SRR3438462 ~/wgs_project/rawdata/fastq ~/wgs_project/output YP
	# output
		YP/fastqc/YP_1_fastqc.html YP_1_fastqc.zip YP_2_fastqc.html YP_2_fastqc.zip

## 3_trim_to_filtration
### shell order
	bash /home/GT20286/wgs_project/shell/3_trim_to_filtration/0_run_all.sh input indir outdir outname

	# help
	input: name of the input file (SRRXXXX)
	indir: input directory (~/wgs_project/rawdata/fastq)
	outdir: out directory (~/wgs_project/output)
	outname: outfile name (YP/BLD/DX...)

	If want to run shell step by step, please view: /home/GT20286/wgs_project/shell/3_trim_to_filtration/README

### example result
	# input
		SRR3438462 ~/wgs_project/rawdata/fastq ~/wgs_project/output YP
	## 1_trim.sh output
		YP_1.clean.fastq.gz YP_2.clean.fastq.gz
	## 2_bwa+markdup.sh
		YP.sorted.markdup.bam YP.sorted.markdup.bam.bai
	## 3_variant_call.sh
		YP.filter.vcf.gz YP.filter.vcf.gz.tbi

## 4_annotation
### shell order
	bash /home/GT20286/wgs_project/shell/4_annotation/annotation.sh indir outname

	# help
	indir: input direactory (/home/GT20286/wgs_project/output)
	outname: (outname: YP,BLD...)

### example result
	# input
		/home/GT20286/wgs_project/output YP
	# output
		/home/GT20286/wgs_project/output/anno/YPvep

## 5_genotyping
### shell order
	bash /home/GT20286/wgs_project/shell/5_genotyping/genotyping.sh indir outdir chr

	# help
	indir: input directory (/home/GT20286/wgs_project/output)
	outdir: output directory (/home/GT20286/wgs_project/genotyping)
	chr: chromosome that want to generate panel

### example result
	# input
		/home/GT20286/wgs_project/output /home/GT20286/wgs_project/genotyping 1
	# output
		/home/GT20286/wgs_project/genotyping/chr1/top50/YP_chr1_top50.vcf.gz

## 6_prediction
### shell order
	bash /home/GT20286/wgs_project/shell/6_prediction/prediction.sh h|p|d dir

	# help
	dir: directory (~/wgs_project/output)
	Try 'bash /home/GT20286/wgs_project/shell/6_prediction/prediction.sh h' for help

### example result
	# input
		~/wgs_project/output
	# output
		YP/anno/YP_pathgene.txt YP_dogene.txt YP_do.txt

