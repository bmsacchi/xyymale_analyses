#!/bin/bash
genomeindex=/ohta2/bianca.sacchi/xyy_male/data/genome_hap2
names=../data/STAR_hap2_hyb/filelist_rna
outprefix=../data/STAR_hap2_hyb/star

echo "time to map!"

while read sample
do

STAR --genomeDir $genomeindex \
--readFilesIn /ohta2/Rumex/hybrid_illumina_data/mRNA/${sample}R1.fastq.gz /ohta2/Rumex/hybrid_illumina_data/mRNA/${sample}R2.fastq.gz \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--twopassMode Basic \
--twopass1readsN -1 \
--outFileNamePrefix ${outprefix}/${sample}_hap2 \
--runThreadN 16 \

done < $names

wait


echo "mapping done!"
