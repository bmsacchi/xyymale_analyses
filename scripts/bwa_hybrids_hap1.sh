#!/bin/bash
now=$(date)
echo "$now"
echo "bwamem2 version"
bwa-mem2 version

INPATH=/ohta2/Rumex/hybrid_illumina_data/dna_fastqs # where the hybrid raw fastq's are stored
OUTPATH=/ohta2/bianca.sacchi/xyy_male/data/bwamem2_hap1
PATH_TO_HAP1_REFERENCE=/ohta2/bianca.sacchi/xyy_male/data/bwamem2_hap1/H1NCmale.fa
SAMPLE_LIST=$(cat /ohta2/bianca.sacchi/hybrid_project/filelist_april2022) ##list of the samples to analyse

#bwa-mem2 index run on fasta

for i in $SAMPLE_LIST

do

bwa-mem2 mem -t 8 $PATH_TO_HAP1_REFERENCE $INPATH/$i\R1.fastq.gz $INPATH/$i\R2.fastq.gz > $OUTPATH/$i.sam

done



