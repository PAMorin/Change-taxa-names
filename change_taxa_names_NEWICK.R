#Sebastian Duchene's script for changing sequence names in a fasta file or in a tree file.
#Use with example files like this:

rm (list=ls())
install.packages("phangorn")
source("/Applications/R stuff/change.names/change.taxa.names.R")

#prepare a cvs file with old names in the left column and the corresponding new names on the right. no header or rownames should be added. The old names should be in the object exactly as those in the tree or alignment.

new.names <- read.csv("names.csv", sep=",",head=F, as.is=T)
# if the file is a tree, make sure its in newick format
tr <- read.tree("drag tree file here")
#tr <- read.nexus("filename.nex") #try to see if this works.

# If the file is an alignment make sure its in fasta format, and use:

#alin <- read.dna("alignment.fasta", format="fasta")

# Now we can change the names using the function change.taxa.names. Un-comment one of the below depending on whether the file is a fasta file (alin) or tree file (tr)

new.object <- change.taxa.names(tr, new.names)
#new.object <- change.taxa.names(alin, new.names)


# And now we just need to save the object

# if its an alignment:
#write.dna(new.object, "newname_alignment.fasta", format="fasta", colsep = "", nbcol = -1)

# If its a tree
write.tree(new.object, "filename.newick")
    #for parenthetic format = NEWICK
#write.nexus(new.object, "filename.nex")
    #for nexus format
