#!/bin/bash
# A script to perform quality control on RNA-Seq data using FastQC and FastQ Screen

# Variables for directories
DATA_DIR="../results/cutadapt"
RESULTS_DIR="../results"
FASTQC_DIR="$RESULTS_DIR/fastqc_trimmed"
MULTIQC_DIR="$RESULTS_DIR/multiqc_trimmed"
LOG_DIR="$RESULTS_DIR/logs"

# Make directories
mkdir -p $FASTQC_DIR $MULTIQC_DIR

# Run FastQC
echo "Running FastQC for trimmed reads..."
fastqc --outdir $FASTQC_DIR $DATA_DIR/*.fastq.gz 2>&1 | tee $LOG_DIR/fastqc_trimmed.log

# Run MultiQC
echo "Running MultiQC report for trimmed reads..."
multiqc -o $MULTIQC_DIR $FASTQC_DIR 2>&1 | tee $LOG_DIR/multiqc_trimmed.log

echo "Quality control completed for trimmed reads. Check $RESULTS_DIR for output files and $LOG_DIR for logs."
