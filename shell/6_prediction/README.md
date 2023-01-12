# select genes to predict pathways and phenotypes

## process
	Run 'bash prediction.sh h|p|d dir'

## parameter
	dir=$2	# directory: ~/wgs_project/output

## pathway genes select: gene with deleterous SNP and HIGH impact SNP on different chromosome
	cat filevep|grep -v "#"|grep -E "deleterious(|HIGH"|awk '{print $4}'|sort|uniq > line_pathgene.txt
	upload file to DAVID website

## phenotype genes select: gene with HIGH impact SNP from whole strain
	cat filevep|grep -v "#"|grep "HIGH"|awk '{print $4}'|sort|uniq > line_dogene.txt
	use line_dogene.txt to align disease > line_do.txt
