#!/bin/bash
#*****************************************************
# bbmap demultiplexing script
#*****************************************************
# working directory
scriptDir=/script
inputDir=/fastq
outputDir=/ouput

demuxbyname.sh \
  prefixmode=f \
  names=$scriptDir/barcodes.txt \
    in=$inputDir/fastq_R1.fastq.gz \
    in2=$inputDir/fastq_R2.fastq.gz \
      out=$outputDir/%_R1.fastq.gz \
      out2=$outputDir/%_R2.fastq.gz \
        outu=$outputDir/unmatched_R1.fastq.gz \
        outu2=$outputDir/unmatched_R2.fastq.gz

#*****************************************************
# rename indexes to match pools names, based on
# https://unix.stackexchange.com/questions/87694/renaming-files-based-on-the-contents-of-a-text-file
#*****************************************************
while read line ; do
    mv $line
done < $scriptDir/barcodes_to_names.txt
