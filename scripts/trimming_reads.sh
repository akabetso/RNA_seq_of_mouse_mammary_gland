# Trimming is crucial preprocessing step in RNA-seq analysis. Errors can be due to adapter contaminations, low-quality bases or short and unwanted sequences. 

# After analysing the adapters contents module in the multiqc report, the plot shows less than 1% (<=0.60%) of sequence with leftover adapters, but this is very low level contamination maynot interfer with downstream analysis. so data is clean but for precautions, we may trim the adapter sequence.

# Moving the the per sequence quality module, average quality score is at 38, this is a good average score for nicely prepaired library. the peak is even and not randomly distributed over the plot. but the red zone shows that 5 reads have quality scores less than 20. this is not a significant issue to worry about but to be on the safe sides, it's better to trim this reads, this is precautious to ensure that any low-quality bases are removed and will not affected the mapping of reads to reference genomes.

# Now, let's proceed with trimming using cutadapt.

# Directories
DATA_DIR="../data/raw"
RESULTS_DIR="../results"
LOG_DIR="../results/logs"

mkdir -p $RESULTS_DIR/cutadapt

# The -a command specifies the adapter sequence to be trimmed from the 3' end of the read. this sequence is commonly found in illumina libraries and need to be removed to reduce the 0.60% adapter contamination to less than 0.1%. 

# -q 20 trims single-end reads where the quality score falls below 20.

#-m 20 ensures that only reads longer than 20 bases are kept after trimming.

# Loop over each sample file and perform trimming
for i in {444..455}; do
    SAMPLE="SRR1552${i}"
    echo "Trimming reads for $SAMPLE..."
    cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC \
        -q 20 -m 20 \
        -o $RESULTS_DIR/cutadapt/${SAMPLE}_trimmed.fastq.gz \
        $DATA_DIR/${SAMPLE}.fastq.gz 2>&1 | tee -a $LOG_DIR/cutadapt.log
done

echo "Trimming completed. Check $RESULTS_DIR for output files and $LOG_DIR for logs."
