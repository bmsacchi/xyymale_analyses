#!/bin/bash
PICARD=/ohta1/bianca.sacchi/bin/picard/build/libs/picard.jar
SAMDIR=/ohta2/bianca.sacchi/xyy_male/data/STAR_hap2
echo "picard version"
java -jar /ohta1/bianca.sacchi/bin/picard/build/libs/picard.jar SortSam --version
#version should be 2.25.5-SNAPSHOT 

for i in "10.TM4_" "11.TM5_" "12.TM6_" "1.TF1_" "2.TF2_" "3.TF3_" "4.TF4_" "5.TF5_" "6.TF6_" "7.TM1_" "8.TM2_" "9.TM3_" "13.NF1_" "14.NF2_" "15.NF3_" "16.NF4_" "18.NF5_" "19.NF6_" "20.NM1_" "21.NM2_" "22.NM3_" "23.NM4_" "25.NM5_" "27.NM6_"

do

java -jar $PICARD SortSam \
        I=$SAMDIR/pass2_$i\Aligned.out.sam \
        O=/ohta2/bianca.sacchi/xyy_male/data/STAR_hap2/sort_$i.bam \
        SORT_ORDER=coordinate \
        VALIDATION_STRINGENCY=LENIENT

wait 

java -jar $PICARD AddOrReplaceReadGroups \
        I=/ohta2/bianca.sacchi/xyy_male/data/STAR_hap2/sort_$i.bam \
        O=/ohta2/bianca.sacchi/xyy_male/data/STAR_hap2/sortrg_$i.bam \
        VALIDATION_STRINGENCY=LENIENT \
        RGID=$i \
        RGLB=lib1$i \
        RGPL=illumina$i \
        RGPU=unit1$i \
        RGSM=sample$i

done
