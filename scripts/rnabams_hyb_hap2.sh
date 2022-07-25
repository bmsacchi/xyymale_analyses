#!/bin/bash
PICARD=/ohta1/bianca.sacchi/bin/picard/build/libs/picard.jar
SAMDIR=../data/STAR_hap2_hyb/star
OUTDIR=../data/STAR_hap2_hyb/rgnocigar
names=../data/STAR_hap2_hyb/filelist_rna

while read sample 
do

java -jar $PICARD AddOrReplaceReadGroups \
        I=$SAMDIR/${sample}_hap2Aligned.sortedByCoord.out.bam \
        O=$OUTDIR/${sample}rg_hap2.bam \
        VALIDATION_STRINGENCY=LENIENT \
        RGID=$i \
        RGLB=hap2 \
        RGPL=illumina \
        RGPU=unit1$i \
        RGSM=$i

gatk SplitNCigarReads \
	-R ../data/bwamem2_hap2/H2NCmale.fa \
	-I $OUTDIR/${sample}rg_hap2.bam \
	-O $OUTDIR/${sample}rgnocig_hap2.bam
done < $names
