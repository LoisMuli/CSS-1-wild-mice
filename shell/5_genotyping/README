# select top 50 variants from each chromosome

## process
	Run 'bash genotyping.sh indir oudir chr'

## parameter
	indir=$1	# input directory: /home/GT20286/wgs_project/output
	outdir=$2	# output directory:/home/GT20286/wgs_project/genotyping
	chr=$3		# chromosome that want to generate panel
# software to select SNPs: SnpSift and bcftools
# both under conda environment
	conda acctivate wgs
## select procedure
	select SNPs passed hard filtration on specific chromosome 	

	merge all strain chromosome + find unique homozygous SNPs from merged vcf
	
	seperate merged vcf; select depth > 40X and QD score ranked top 50
				
