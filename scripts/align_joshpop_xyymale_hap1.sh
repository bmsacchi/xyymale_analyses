#!/bin/bash

#echo 
STAR --runThreadN 4 --runMode genomeGenerate \
--genomeDir /ohta2/bianca.sacchi/xyy_male/data/genome_hap1 \
--genomeFastaFiles /ohta2/Rumex/Dovetail_xyy_pacbio-male/scaffolded_assembly/H1NCmale.fa \


wait

echo "genome done!"
echo "time to map!"

for i in "10.TM4_" "11.TM5_" "12.TM6_" "1.TF1_" "2.TF2_" "3.TF3_" "4.TF4_" "5.TF5_" "6.TF6_" "7.TM1_" "8.TM2_" "9.TM3_" "13.NF1_" "14.NF2_" "15.NF3_" "16.NF4_" "18.NF5_" "19.NF6_" "20.NM1_" "21.NM2_" "22.NM3_" "23.NM4_" "25.NM5_" "27.NM6_"

do

STAR --genomeDir /ohta2/bianca.sacchi/xyy_male/data/genome_hap1 \
--readFilesIn /ohta1/felix.beaudry/rawSequence/RNAseq/josh/pop/$i\R1_clean.fastq.gz \
/ohta1/felix.beaudry/rawSequence/RNAseq/josh/pop/$i\R2_clean.fastq.gz \
--readFilesCommand zcat \
--twopassMode Basic \
--twopass1readsN -1 \
--outFileNamePrefix /ohta2/bianca.sacchi/xyy_male/data/STAR_hap1/pass2_$i \
--runThreadN 16

done

wait

echo "mapping done!"
