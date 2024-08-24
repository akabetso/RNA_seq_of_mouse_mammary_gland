# RNA-seq of Mouse mammary gland

## A brief description:
![Basal and Luminal cells experiment](./data/mammary_gland.png)

The main aim of this work was to reproduce in a linux environment the workflow from [galaxy](https://training.galaxyproject.org/training-material/topics/transcriptomics/tutorials/rna-seq-reads-to-counts/tutorial.html#Fu2015) most importantly, working with publicly avalable data. Working with publicly available data demands rigor and meticulous attention to detail, ensuring consistency and interoperability across datasets, while prioritizing the highest standards of quality. Equally, Keeping a close eye on your data throughout the analysis is crucial. It helps manage your results effectively and allows you to quickly spot and address any silent errors that might otherwise go unnoticed. 

This project contains 1000 sub-reads accross 12 samples of mouse mammary gland cells from [zenodo](https://zenodo.org/records/4249555), the reference genome (mm39) and its annotation file was downloaded from [ensembl](https://www.ensembl.org/info/data/ftp/index.html): 

## Workflow:
Using MultiQC to generate a FastQC report summary, we observed that duplicates were present in less than 0.2% of all samples, with three samples showing duplicates between 1% and 3%. Duplicates generally arise from overly expressed genes, but they can also result from technical artifacts or sequencing errors.

The GC content was as expected for mammalian cells. The Phred quality scores for sequencing were below 20 for 5 reads, which is typically due to degradation in longer reads. We used Cutadapt to trim low-quality scores and to filter out adapter contaminants, which are often introduced during PCR amplification or from reads originating from other organisms. We then conducted additional quality control to confirm the results.

Alignment of the trimmed file to reference genome was done with HITSAT2, the reads are single-paired and unstranded. the sam files are then sorted and compressed to bam files for featureCounts. after featurecounts. the output of featureCounts is converted to a matrix counts csv file ready for differential gene analysis, assigned reads were above 80% accross all samples. the remaining unassigned reads were due to unmapped reads which can be further analysed or blast to have a broader understandy of them. But as this is only a sub-read of 1000 per sample, the counts matrix mostly have zeros and is not suitable for downstream differential analysis. 

## Whats next:
As mentioned, the previous work was to provide a basic understanding of transcritomic workflow as well working with publicly available data. to apply this, I will next reproduce figures from a recent publication [Dotsenko-et-al.-2024](https://www.nature.com/articles/s41590-024-01867-0). a recent study to evaluate the effectiveness of the TG2 inhibitor ZED1227 in treating celiac disease (CeD) by analyzing its impact on gene expression in duodenal biopsies before and after gluten exposure

