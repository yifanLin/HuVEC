#!bin/bash
#This script runs picard mark duplicates
#For ChIP Samples
module load picard
module load samtools
cd /oasis/tscc/scratch/$USER/ChIP/mapped
# loop for all the samples
for j in {1..6};
	do
	FILENAME=`sed -n ''$j'p' /oasis/tscc/scratch/$USER/ChIP/mapped/ChIP_samples.txt`
    echo $FILENAME
#Run picard mark duplicates
export CHROMOSOMES=$(samtools view -H ${FILENAME}.bb.mapped.sorted.md.bam | grep '^@SQ' | cut -f 2 | grep -v -e _ -e chrEBV -e 'VN:' | sed 's/SN://' | xargs echo); samtools view -b -h -f 3 -F 4 -F 8 -F 256 -F 1024 -F 2048 ${FILENAME}.bb.mapped.sorted.md.bam $CHROMOSOMES > ${FILENAME}bb.mapped.sorted.nd.bam
done
