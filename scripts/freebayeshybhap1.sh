#!/bin/bash

# gnu parallel??

parallel 'freebayes --fasta-reference ../H1NCmale.fa --bam {} --use-best-n-alleles 4 --gvcf > {.}.xyymh1.vcf' ::: *.bam


parallel 'freebayes --fasta-reference ../H2NCmale.fa --bam {} --use-best-n-alleles 4 --gvcf > {.}.xyymh2.vcf' ::: *.bam 2> paralog.txt
