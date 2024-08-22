# if (!requireNamespace("BiocManager", quietly = TRUE, force = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("biomaRt", force = TRUE)

#setting working directory
setwd("C:/Users/Saurav/Desktop/UM_proj")

#calling libarary
library(biomaRt)

#loading query table
snp_table <- read.table("variant_list.txt", header = TRUE, sep = "\t")

#calling ensamble SNP database
ensembl <- useMart("ENSEMBL_MART_SNP", dataset = "hsapiens_snp")

#storing gene infor by snp filtering
gene_info <- data.frame(getBM(attributes=c("refsnp_id", "chr_name", "chrom_start", "chrom_end",
                                "allele", "mapweight", "validated", "allele_1", "minor_allele",
                                "minor_allele_freq", "minor_allele_count", "clinical_significance",
                                "synonym_name", "ensembl_gene_stable_id"), filters="snp_filter", values=snp_table$RSID,
                   mart=ensembl, uniqueRows=TRUE))

#writing table for future use
write.table(gene_info,file = "rsid_gene_info.csv", sep = ",")
