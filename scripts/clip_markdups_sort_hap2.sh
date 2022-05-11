#!/bin/bash
prefix=/ohta2/bianca.sacchi/xyy_male/data/bwamem2_hap2/
ref=/ohta2/bianca.sacchi/xyy_male/data/bwamem2_hap2/H2NCmale.fa
out=/ohta2/bianca.sacchi/xyy_male/data/bwamem2_hap2/AnalysisReadyHap2
names=/ohta2/bianca.sacchi/hybrid_project/filelist_april2022
tmp=/ohta2/bianca.sacchi/xyy_male/data/bwamem2_hap2/tmp_hap2
#samclip 0.4.0
#Using GATK jar /ohta1/bianca.sacchi/bin/gatk-4.2.2.0/gatk-package-4.2.2.0-local.jar
echo "start softclipping"
samclip --version
wait

while read sample
do

samclip --ref $ref < ${prefix}/${sample}.sam > ${tmp}/${sample}.xyym2.clip.bam

done < $names

wait
echo "softclipping finished"
echo "adding read groups and marking duplicates"

while read sample
do

gatk --java-options "-Xmx8g" AddOrReplaceReadGroups \
     -I ${tmp}/${sample}.xyym2.clip.bam \
     -O ${tmp}/${sample}.xyym2.clip.rg.bam \
     -ID ${sample} \
     -LB hybref2 \
     -PL ILLUMINA \
     -PU unit1 \
     -SM ${sample}  &&

gatk MarkDuplicatesSpark \
    -I ${tmp}/${sample}.xyym2.clip.rg.bam \
    -O ${out}/${sample}.xyym2.clip.rg.mdsort.bam \
    -M ${out}/${sample}.metrics2.txt \
    --tmp-dir $tmp \
    --conf 'spark.executor.cores=10' \
    --conf 'spark.executor.memory=8G'

done < $names

NotifyMe.sh
