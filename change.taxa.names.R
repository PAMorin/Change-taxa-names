
library(phangorn)
# This function changes taxa names in a tree or dna alignment. Load a tree or alignment and a table (preferably using as.matrix(read.table()) function) with the "old" names in the first column, and the "new" names in the second (names to be substituted)). The function returns the object with the names changed, such that new.tree <- change.taxa.names.tree(old.tree)

change.taxa.names <- function(object, taxa.names){
  if(class(object)=="phylo"){
    for(i in 1:length(object$tip.label)){
      object$tip.label[i] <- taxa.names[,2][taxa.names[,1]==object$tip.label[i]]
    }
  }
  if(class(object)=="DNAbin" | class(object)=="matrix"){
    for(i in 1:nrow(object)){
      rownames(object)[i] <- taxa.names[,2][taxa.names[,1]==rownames(object)[i]]
    }
  }
  
return(object)
}


