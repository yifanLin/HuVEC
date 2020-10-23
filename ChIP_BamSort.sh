#!bin/bash
#This script runs samtools sort.
#For ChIP Samples
module load samtools
cd /oasis/tscc/scratch/$USER/ChIP/mapped
# loop for all the samples
for j in {1..6};
	do
	FILENAME=`sed -n ''$j'p' /oasis/tscc/scratch/$USER/ChIP/mapped/ChIP_samples.txt`
    echo $FILENAME
#Run samtools bam sort
#Set -@ to processors
samtools sort -@ 10 -O -h bam -o ${FILENAME}.bb.mapped.sorted.bam ${FILENAME}.bb.mapped.bam
done
