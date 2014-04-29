#!/bin/bash -l
# script to take individual bam and split into individual chromosomes 

# This script will prepare for ChIPseeqer
# Requires samtools 

# Created by Marco Pinheiro on 29/04/2014.

# Load bamtools module

source /etc/profile.d/modules.sh
module load apps/bamtools/20130503-75af0fbc1c


# First seperate out Brk files and make ChIP and Input Directories.

cd Brk/2to2.5/Exp1 
mkdir CHIP
mkdir INPUT
bamtools split -in Brk_2to2.5hr_exp1_AS_20110615_AS_02_IP_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix Brk_2to2.5_Exp1_IP_
mv Brk_2to2.5_* CHIP/
bamtools split -in Brk_2to2.5hr_exp1_AS_20110615_AS_01_PI_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix Brk_2to2.5_Exp1_PI_
mv Brk_2to2.5_* INPUT/

cd ../Exp2/ 
mkdir CHIP
mkdir INPUT
bamtools split -in Brk_2to2.5hr_exp2_AS_20110615_AS_06_IP_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix Brk_2to2.5_Exp2_IP_
mv Brk_2to2.5_* CHIP/
bamtools split -in Brk_2to2.5hr_exp2_AS_20110615_AS_05_PI_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix Brk_2to2.5_Exp2_PI_
mv Brk_2to2.5_* INPUT/

cd ../../3to3.5/Exp1
mkdir CHIP
mkdir INPUT
bamtools split -in Brk_3to3.5hr_exp1_AS_20101108_GP_BRK_2_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix Brk_3to3.5_Exp1_IP_
mv Brk_3to3.5_* CHIP/
bamtools split -in Brk_3to3.5hr_exp1_AS_20101108_GP_PI_2_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix Brk_3to3.5_Exp1_PI_
mv Brk_3to3.5_* INPUT/

cd ../Exp2
mkdir CHIP
mkdir INPUT
bamtools split -in Brk_3to3.5hr_exp2_AS_20101108_GP_BRK_2_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix Brk_3to3.5_Exp2_IP_
mv Brk_3to3.5_* CHIP/
bamtools split -in Brk_3to3.5hr_exp2_AS_20101108_GP_PI_2_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix Brk_3to3.5_Exp2_PI_
mv Brk_3to3.5_* INPUT/

# Then seperate out pMad. 

cd ../../../pMad/2to2.5/Exp1/
mkdir CHIP
mkdir INPUT
bamtools split -in pMad_2to2.5hr_exp1_AS_20110615_AS_04_IP_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix pMad_2to2.5_Exp1_IP_
mv pMad_2to2.5_* CHIP/
bamtools split -in pMad_2to2.5hr_exp1_AS_20110615_AS_03_PI_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix pMad_2to2.5_Exp1_PI_
mv pMad_2to2.5_* INPUT/

cd ../Exp2
mkdir CHIP
mkdir INPUT
bamtools split -in pMad_2to2.5hr_exp2_AS_20110615_AS_08_IP_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix pMad_2to2.5_Exp2_IP_
mv pMad_2to2.5_Exp2_IP_* CHIP/
bamtools split -in pMad_2to2.5hr_exp2_AS_20110615_AS_07_PI_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix pMad_2to2.5_Exp2_PI_
mv pMad_2to2.5_Exp1_PI_* INPUT/

cd ../../3to3.5/Exp1
mkdir CHIP
mkdir INPUT
bamtools split -in pMad_3to3.5hr_exp1_AS_20101108_Rb_PS1_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix pMad_3to3.5_Exp1_IP_
mv pMad_2to2.5_Exp1_IP_* CHIP/
bamtools split -in pMad_3to3.5hr_exp1_AS_20101108_Rb_PI_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix pMad_3to3.5_Exp1_PI_
mv pMad_2to2.5_Exp1_PI_* INPUT/

cd ../Exp2
mkdir CHIP
mkdir INPUT
bamtools split -in pMad_3to3.5hr_exp2_AS_20101108_Rb_PS1_2_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix pMad_3to3.5_Exp2_IP_
mv pMad_3to3.5_IP_* CHIP/
bamtools split -in pMad_3to3.5hr_exp2_AS_20101108_Rb_PI_2_bfast_dm3_a3_best_unique_sorted.bam -reference -refPrefix pMad_3to3.5_Exp2_PI_
mv pMad_3to3.5_PI_* INPUT/