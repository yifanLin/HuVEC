#!bin/bash
#This script runs samtools index.
#For ChIP Samples
module load samtools
cd /oasis/tscc/scratch/$USER/ChIP/mapped
# loop for all the samples
for j in {1..6};
	do
	FILENAME=`sed -n ''$j'p' /oasis/tscc/scratch/$USER/ChIP/mapped/ChIP_samples.txt`
    echo $FILENAME
#Run samtools bam index
#Set -@ to processors
samtools index -@ 10 ${FILENAME}.bb.mapped.sorted.bam
done
