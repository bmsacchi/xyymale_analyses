#!/bin/bash
## running compmap pipeline
## WARNING this is not yet modified for Paired end reads yet

## warning: splitncigar output won't work since NH tag is missing. womp!

## don't forget the --star flag, outputs all zeros otherwise... oops!
for i in  "13.NF1_" "14.NF2_" "15.NF3_" "16.NF4_" "18.NF5_" "19.NF6_" "20.NM1_" "21.NM2_" "22.NM3_" "23.NM4_" "25.NM5_" "27.NM6_" 
do

/ohta2/bianca.sacchi/CompMap/CompMap \
	-1 ../data/STAR_hap1_pop/sortrg/sortrg_${i}.bam \
	-2 ../data/STAR_hap2_pop/sortrg/sortrg_${i}.bam \
	-b1 ../data/compmap/hap1_lift_mrna.bed \
	-b2 ../data/compmap/hap2_sharedwlift_mrna.bed \
	--base ${i} \
	--star \
	--binom \
        -s1 d1 \
        -s2 d2 
done 
