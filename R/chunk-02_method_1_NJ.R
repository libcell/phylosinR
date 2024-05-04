## method_1: NJ 
# install.packages("ape")
library(ape)
# computing a matrix of pairwise distances from DNA sequences
dist <- dist.dna(dna_K00927)   
# reconstructing a NJ tree from a distance matrix with possibly missing values
treenj <- njs(dist) 
treenj <- root(treenj, outgroup = "ece", r = TRUE)
# bootstrap analysis
bstrees <- boot.phylo(treenj, dna_K00927,
                      FUN = function(x) nj(dist.dna(x)),
                      trees = FALSE)
# Visualizing the NJ tree 
plot(treenj)
# adding bootstrap values
drawSupportOnEdges(bstrees)