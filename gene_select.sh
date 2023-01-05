#!/usr/bin/bash

# input data
inp=$1
outname=$2

# gene id write in and select

for id in $(cat $inp);
do
grep -w $id MGI_Gene_Model_Coord.rpt| awk '{print $1}' >> ${outname}_mgi
done

for mgi in $(cat ${outname}_mgi);
do
grep -w $mgi MGI_DO.rpt >> ${outname}_do.txt
done

rm ${outname}_mgi
