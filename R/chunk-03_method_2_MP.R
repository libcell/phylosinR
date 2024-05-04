## method_2: MP
library(phangorn)
library(ape)
# transforming the DNAbin format into the phyDat format
phydata <- as.phyDat(dna_K00927)
# searching for the MP tree(s)
treeRatchet <- pratchet(phydata, trace = 0)
# calculating the branch length by assigning edge weights 
treeRatchet <- acctran(treeRatchet, phydata)
# pruning away internal edges of length tol(default = 1e-08)
treeRatchet  <- di2multi(treeRatchet)
# returning a consensus tree
if(inherits(treeRatchet, "multiPhylo")){
  treeRatchet <- unique(treeRatchet)}
# ploting the consensus tree with the bootstrap values
plotBS(treeRatchet)