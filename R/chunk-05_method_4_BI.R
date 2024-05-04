## method_4: BI
# install.packages("babette")
library(babette)
library(ape)
# running BEAST2 for bayesian phylogenetic analysis
outputs <- bbt_run_from_model("./data/ntK00927.fas",
                              inference_model = create_inference_model(),
                              beast2_options = create_beast2_options())
# extracting the tree with the highest posterior
treeBI <- outputs$ntK00927_trees[[which.max(outputs$estimates$posterior)]]
# merging all Convergent samples into a list(multiphylo)
con.trees <- outputs$ntK00927_trees[3:10001]
# calculating the posterior of the bifurcations in the BI tree
posterior <- round(prop.clades(treeBI, con.trees)/9999*100)
# Visualizing the BI tree 
plot(treeBI)
# adding posterior values of the bifurcations
drawSupportOnEdges(posterior)