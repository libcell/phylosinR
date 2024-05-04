## merge_method: supertree
library(phangorn)
# constructing sigle gene trees, storing which in a list(multiphylo)
dna <- c("ntK01939", "ntK03644", "ntK00797", "ntK00826", "ntK00088",
         "ntK02257", "ntK00164", "ntK00820", "ntK06158", "ntK00008")
i <- 0
mtree <- c()
for (k in dna) {
  i <- i + 1
  dna <- fasta2DNAbin(paste0("./data/", k, ".fas"))  
  # transforming the DNAbin format into the phyDat format
  phydata <- as.phyDat(dna)
  # Comparing nucleotide substitution models
  modeltest <- modelTest(phydata)
  # infering a tree using maximum likelihood method
  pml <- pml_bb(modeltest)
  # storing the ML tree into the list
  mtree[[i]] <- pml$tree
}
class(mtree) <- "multiPhylo"
# estimating a supertree from a set of trees
supertree <- superTree(mtree)
# Visualizing the supertree
plot(supertree)