wkdir <- getwd()
library(adegenet)
# reading alignments with the fasta format and outputing a DNAbin object
dna_K00927 <- fasta2DNAbin("./data/ntK00927.fas")
print(dna_K00927)