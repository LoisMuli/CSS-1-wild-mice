# use VEP to annotate variants

## process
	Run 'bash annotation.sh input outname'

## parameter
	input=$1	# input file: /dir/file.vcf
	outname=$2	# outname: YP,BLD...

## VEP installed under conda environment
	conda activate wgs

## run vcf file to annotate SNP
	vep --biotype --buffer_size 500 --check_existing --distance 5000 --numbers --regulatory --sift b --species mus_musculus --symbol --transcript_version --tsl --cache --input_file inputfile --output_file outname
