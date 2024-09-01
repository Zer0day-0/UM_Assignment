library(clusterProfiler)

#setting working directory
setwd("C:/Users/Saurav/Desktop/UM_proj")

#reading table for enrichment as data
table <- read.csv("C:/Users/Saurav/Desktop/UM_proj/SNP_gene_interaction.csv")
#extracting gene table
gene <- with(table, ensembl_gene_stable_id)

#gene name conversion
eg=bitr(gene, "ENSEMBL", "SYMBOL", "org.Hs.eg.db")[,"SYMBOL"]

#mergeing ID
table$gene_sym <- eg

# Save the merged data as a new CSV file
write.csv(table, "C:/Users/Saurav/Desktop/UM_proj/table_genes_with_symbols.csv", row.names = FALSE)