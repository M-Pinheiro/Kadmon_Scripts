# Cufflinks script to align RNA-seq reads of D.melanogaster embryos between 0-24 hours with 2 hour intervals. Sequencing files obtained from Graverly et al., 2011 "The Developmental Transcriptome of Drosophila Melanogaster.".
# Script and analysis protocol based on Trapnell et al., 2012 "Differential gene and transcript expression analysis of RNA-seq experiments with TopHat and Cufflinks."

# Script has been modified according to running on the Kadmon System. 
# Modify library type options based on RNA-seq protocol - protocol is TruSeq - type is fr-unstranded - should appear as defulat option.

module load apps/bowtie2/2.2.2
module load apps/tophat/2.0.11

# Step 1: Align the RNA-seq reads to the genome - Map the reads for each sample to the reference genome:

tophat -p 8 -G genes.gtf -o 0-2 genome SRR767606_1.fq SRR767606_2.fq

tophat -p 8 -G genes.gtf -o 2-4 genome SRR767626_1.fq SRR767626_2.fq

tophat -p 8 -G genes.gtf -o 4-6 genome SRR767609_1.fq SRR767609_2.fq

tophat -p 8 -G genes.gtf -o 6-8 genome SRR767610_1.fq SRR767610_2.fq

tophat -p 8 -G genes.gtf -o 8-10 genome SRR767615_1.fq SRR767615_2.fq

tophat -p 8 -G genes.gtf -o 10-12 genome SRR767616_1.fq SRR767616_2.fq

tophat -p 8 -G genes.gtf -o 12-14 genome SRR767613_1.fq SRR767613_2.fq

tophat -p 8 -G genes.gtf -o 14-16 genome SRR767618_1.fq SRR767618_2.fq

tophat -p 8 -G genes.gtf -o 16-18 genome SRR767605_1.fq SRR767605_2.fq

tophat -p 8 -G genes.gtf -o 18-20 genome SRR767622_1.fq SRR767622_2.fq

tophat -p 8 -G genes.gtf -o 20-22 genome SRR767620_1.fq SRR767620_2.fq

tophat -p 8 -G genes.gtf -o 22-24 genome SRR767625_1.fq SRR767625_2.fq

module load apps/cufflinks/2.2.0 

# Steps 2 - 4: Assemble expressed genes and transcripts - Assemble transcripts for each sample:

cufflinks -p 8 -o 0-2_cuff 0-2/accepted_hits.bam

cufflinks -p 8 -o 2-4_cuff 2-4/accepted_hits.bam

cufflinks -p 8 -o 4-6_cuff 4-6/accepted_hits.bam

cufflinks -p 8 -o 6-8_cuff 6-8/accepted_hits.bam

cufflinks -p 8 -o 8-10_cuff 8-10/accepted_hits.bam

cufflinks -p 8 -o 10-12_cuff 10-12/accepted_hits.bam

cufflinks -p 8 -o 12-14_cuff 12-14/accepted_hits.bam

cufflinks -p 8 -o 14-16_cuff 14-16/accepted_hits.bam

cufflinks -p 8 -o 16-18_cuff 16-18/accepted_hits.bam

cufflinks -p 8 -o 18-20_cuff 18-20/accepted_hits.bam

cufflinks -p 8 -o 20-22_cuff 20-22/accepted_hits.bam

cufflinks -p 8 -o 22-24_cuff 22-24/accepted_hits.bam

# Created a file called assemblies.txt that lists the assembly file for each sample. The file should contain the following line for all sameples:
# ./0-2_cuff/transcripts.gtf

# Run Cuffmerge on all your assemblies to create a single merged transcriptome annotation:

cuffmerge -g genes.gtf -s genome.fa -p 8 assemblies.txt

# Step 5: Identify differentially expressed genes and transcripts - Run Cuffdiff by using the merged transcriptome assembly along with the BAM files from TopHat for each replicate:

cuffdiff -o diff_out -b genome.fa -p 8 –L 0-2,2-4,4-6,6-8,8-10,10-12,12-14,14-16,16-18,18-20,20-22,22-24 -u merged_asm/merged.gtf \

./0-2/accepted_hits.bam,./2-4/accepted_hits.bam,./4-6/accepted_hits.bam,./6-8/accepted_hits.bam,./8-10/accepted_hits.bam,./10-12/accepted_hits.bam,./12-14/accepted_hits.bam,./14-16/accepted_hits.bam,./16-18/accepted_hits.bam,./18-20/accepted_hits.bam,./20-22/accepted_hits.bam,./22-24/accepted_hits.bam

# Script-end