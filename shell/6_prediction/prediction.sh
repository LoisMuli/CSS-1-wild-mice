#!/bin/bash

# reference
reference=/home/GT20286/reference/phenotype
# parameter
dir=$2	# directory: ~/wgs_project/output


if [ $1 = "h" ] # help
then
echo "usage: prediction_gene_select.sh h|p|d dir"
echo "dir: directory (~/wgs_project/output)"
echo "h (help): print this message"
echo "p (select genes to predict pathways, pathway enrichment use DAVID): line_pathgene.txt"
echo "d (disease that strain might have): line_do.txt"

elif [ $1 = "p" ]
then
	for line in $(ls $2);
	do
	cat $2/${line}/anno/${line}vep |grep -v "#"|grep -E "deleterious(|HIGH"|awk '{print $4}'|sort|uniq > $2/${line}/anno/${line}_pathgene.txt
	done

elif [ $1 = "d" ]
then
	for line in $(ls $2);
        do
	cat $2/${line}/anno/${line}vep |grep -v "#"|grep "HIGH"|awk '{print $4}'|sort|uniq > $2/${line}/anno/${line}_dogene.txt
		for id in $(cat $2/${line}/anno/${line}_dogene.txt);
		do
		grep -w $id $reference/MGI_Gene_Model_Coord.rpt| awk '{print $1}' >> $2/${line}/anno/${line}_mgi
		done
		for mgi in $(cat $2/${line}/anno/${line}_mgi);
		do
		grep -w $mgi $reference/MGI_DO.rpt >> $2/${line}/anno/${line}_do.txt
		rm -rf $2/${line}/anno/${line}_mgi
		done
	done

else
echo "Try 'prediction_gene_select.sh h' for more information"

