#!bin/bash
#This script runs samtools sort.
#For ChIP Samples
module load picard
cd /oasis/tscc/scratch/$USER/ChIP/mapped
# loop for all the samples
for j in {1..12};
	do
	FILENAME=`sed -n ''$j'p' /oasis/tscc/scratch/$USER/ChIP/mapped/ChIP_samples.txt`
    echo $FILENAME
#Run picard mark duplicates
java -jar /opt/biotools/picard/picard.jar MarkDuplicates \
I=${FILENAME}_bb.mapped.sorted.bam \
O=${FILENAME}_bb.mapped.sorted.md.bam \
ASSUME_SORTED=true \
METRICS_FILE=${FILENAME}.markdup.metrics \
VALIDATION_STRINGENCY=LENIENT
done
