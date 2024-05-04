## method_3: ML
library(phangorn)
# transforming the DNAbin format into the phyDat format
phydata <- as.phyDat(dna_K00927) 
# Comparing nucleotide substitution models
modeltest <- modelTest(phydata)
# infering a tree using maximum likelihood method
pml <- pml_bb(modeltest)
# bootstrap analysis
bstrees <- bootstrap.pml(pml)
# ploting the ML tree with the bootstrap values
plotBS(pml$tree, bstrees)