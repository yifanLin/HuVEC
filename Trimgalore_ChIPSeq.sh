#!bin/bash
#This script runs trimgalore.
#For ChIP-Seq Samples
cd /oasis/tscc/scratch/$yourusername/ChIPSeqData
mkdir /oasis/tscc/scratch/$yourusername/ChIPSeqData/clean
# loop for all the samples
for j in {1..131};
do
    FILENAME=`sed -n ''$j'p' /oasis/tscc/scratch/$yourusername/ChIPSeqData/ChIPSeq_Samples.txt`
    echo $FILENAME
#Run trimgalore
~/programs/TrimGalore-0.6.5/trim_galore \
--quality 30 \
--fastqc \
--illumina \
--length 48 \
-o /oasis/tscc/scratch/$yourusername/ChIPSeqData/clean \
${FILENAME}.fastq.gz
done
