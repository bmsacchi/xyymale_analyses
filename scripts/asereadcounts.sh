#!/bin/bash

gatk ASEReadCounter \
	-R ../data/bwamem2_hap2/H2NCmale.fa \
	-I ../data/STAR_hap2_hyb/analysisready/ScF2m12__hap2Aligned.sortedByCoord.rg.out.bam \
	-V ../data/vcfs_hap2/NS.1825.004.IDT_i7_159---IDT_i5_159.SCF2m12_replacement_.xyym2.clip.rg.mdsort.xyymh2.vcf \
	-O ../analysis/asecounts_hap2/SCF2m12.table

	 
