#!/bin/bash
PICARD=/ohta1/bianca.sacchi/bin/picard/build/libs/picard.jar
SAMDIR=../data/STAR_hap1_hyb/star
OUTDIR=../data/STAR_hap1_hyb/rgnocigar
names=../data/STAR_hap1_hyb/filelist_rna

while read sample 
do

java -jar $PICARD AddOrReplaceReadGroups \
        I=$SAMDIR/${sample}_hap1Aligned.sortedByCoord.out.bam \
        O=$OUTDIR/${sample}rg_hap1.bam \
        VALIDATION_STRINGENCY=LENIENT \
        RGID=$i \
        RGLB=lib1 \
        RGPL=illumina \
        RGPU=unit1$i \
        RGSM=$i

gatk SplitNCigarReads \
	-R ../data/bwamem2_hap1/H1NCmale.fa \
	-I $OUTDIR/${sample}rg_hap1.bam \
	-O $OUTDIR/${sample}rgnocig_hap1.bam
	--tmp-dir ../../tmp
done < $names
