#!bin/bash
#This script runs bbmap.
#For ChIP-Seq Samples
cd ~/scratch/$yourusername/ChIPSeqData/clean
mkdir ~/scratch/$yourusername/ChIPSeqData/bbmap/
mkdir ~/scratch/$yourusername/ChIPSeqData/bbmap/stats
module load samtools
# loop for all the samples
for j in {1..131};
do
FILENAME=`sed -n ''$j'p' /oasis/tscc/scratch/$yourusername/ChIPSeqData/ChIPSeq_Samples.txt`
echo $FILENAME
#Run bbmap
~/miniconda3/bin/bbmap.sh \
in=~/scratch/$yourusername/ChIPSeqData/clean/${FILENAME}.fq.gz \
out=~/scratch/$yourusername/ChIPSeqData/bbmap/${FILENAME}.bb.mapped.bam \
ref=~/genome_refs/GRCh38.14045.15/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
scafstats=~/scratch/$yourusername/ChIPSeqData/bbmap/stats/${FILENAME}.scafstats.txt \
bhist=~/scratch/$yourusername/ChIPSeqData/bbmap/stats/${FILENAME}.bhist.txt \
ihist=~/scratch/$yourusername/ChIPSeqData/bbmap/stats/${FILENAME}.bb.ihist.txt \
statsfile=~/scratch/$yourusername/ChIPSeqData/bbmap/stats/${FILENAME}.stats.txt \
ambig=random \
maxindel=20 \
trd=t \
nodisk
done
