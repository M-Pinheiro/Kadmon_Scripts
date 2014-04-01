# This is a script to convert .SRA into seperated .fastq files based on read pairing and aligning files against pre-built transcriptome.

# Created by Marco Pinheiro on 01/04/2014.

load module apps/sratoolkit/2.3.3-4

fastq-dump --split-3 SRR767606.sra
fastq-dump --split-3 SRR767626.sra

tar -zcvf SRR767606.sra.tar.gz SRR767606.sra
tar -zcvf SRR767626.sra.tar.gz SRR767626.sra

load module apps/bowtie2/2.2.1

bowtie2 -q -k 100 -N 3 -S SRR767606.sam --no-discordant  /mnt/fls01-home01/mfbx9mp5/scratch/Rotation_2/RefSeq_genes -1 SRR767606_1.fastq -2 SRR767606_2.fastq
bowtie2 -q -k 100 -N 3 -S SRR767626.sam --no-discordant  /mnt/fls01-home01/mfbx9mp5/scratch/Rotation_2/RefSeq_genes -1 SRR767626_1.fastq -2 SRR767626_2.fastq