#!/bin/bash
#freebayes version 1.3.4

freebayes --fasta-reference ../data/bwamem2_hap2/H2NCmale.fa \
--bam-list /ohta2/bianca.sacchi/xyy_male/data/STAR_hap2/bamlist \
--gvcf \
--use-best-n-alleles 4 \
--genotype-qualities \
--vcf poptranscripts_mappedtohap2malexyy.vcf


