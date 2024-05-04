## merge_method: supermatrix
library(devtools)
# devtools::install_github("thibautjombart/apex")
library(apex)
# storing these ten genes in the same list
dna <- c("ntK01939", "ntK03644", "ntK00797", "ntK00826", "ntK00088",
         "ntK02257", "ntK00164", "ntK00820", "ntK06158", "ntK00008")
i <- 0
DNAbin_list <- list()
for (k in dna) {
  i <- i + 1
  dna <- fasta2DNAbin(paste0("./data/", k, ".fas"))
  DNAbin_list[[i]] <- dna
}
# transforming the list of DNAbins into the multidna format
multidna <- new("multidna", DNAbin_list)  
# concatenating the DNA alignments into a single alignement matrix
phydata <- as.phyDat(concatenate(multidna))
# Comparing nucleotide substitution models
modeltest <- modelTest(phydata) 
# infering a tree using maximum likelihood method
pml <- pml_bb(modeltest)
# Visualizing the ML tree 
plot(pml$tree)