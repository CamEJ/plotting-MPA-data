## bar plots MPA data

# set up black, grey and white for clear printing.
library(ggplot2)
library(ggthemr)

# run R-rainbowCols-ggthemr.R to set colour palette if you dont want ggplot default
# also run setFactorOrder-function.R

dat <- read.table("CellcompTrimmed.txt", header = TRUE)
## table of cellular compononet ontology and how many proteins 
# assigned to each, as a percentage of total. 

## set factor order (run function first)

dat[["CellularComp"]] <- setFactorOrder(dat[["CellularComp"]], c("Unknown", "Cytoplasm", "Membrane", "CellMembrane", "CF1", "CellinnerMembrane", 
                                                                 "Nucleus", "Secreted", "Plastid", "Chloroplast", "Mitochondrion", "Others"))



# set new col theme as current
# ran R-rainbowCols-ggthemr script for this. 



## plotting

p <- ggplot(dat, aes(x=Sample, y=Abund, fill=CellularComp), show_guide=FALSE) + 
  geom_bar(stat="identity") + 
  guides(fill = guide_legend(override.aes = list(size=14))) +
   theme_classic() +
 theme(axis.title.x=element_blank()) +
  theme(axis.text.x=element_text(size=16, colour="black")) +
  labs(y = "Percentage") +
  theme(axis.text.y=element_text(size=15, colour="black")) +
  theme(axis.title.y=element_text(size=18, colour="black")) +
  #theme(axis.text.y=element_text(size=9)) +
  theme(legend.title = element_text(size=21)) +
  theme(legend.text=element_text(size=16)) +
 labs(fill="      Cellular\n   Component\n") +
  scale_fill_discrete(labels = c("Unknown", "Cytoplasm", "Membrane", "Cell Membrane", "CF1", "Cell Inner Membrane", 
                                 "Nucleus", "Secreted", "Plastid", "Chloroplast", "Mitochondrion", "Others"))
  
p


####################################
## molecular function plots

## pie plots MPA data

# set up black, grey and white for clear printing.
library(ggplot2)



dat <- read.table("MolecOntol.txt", header = TRUE)

## set factor order (run function first)

dat[["MolFunc"]] <- setFactorOrder(dat[["MolFunc"]], c("Unknown", "Transferase", "Hydrolase", "Oxidoreductase", "Ligase", "Chaperone",  "Kinase", "Lyase", "Protease", "Aminoacyl-tRNAsynthetase",
   "Ribonucleoprotein", "Nucleotidyltransferase", "ElongationFactor", "Helicase", "RibosomalProtein","Isomerase", "Others"))             
## define cols




## plotting

Poo <- ggplot(dat, aes(x=Sample, y=Abund, fill=MolFunc), show_guide=FALSE) + 
  geom_bar(stat="identity") + 
  guides(fill = guide_legend(override.aes = list(size=14))) +
  theme_classic() +
  theme(axis.title.x=element_blank()) +
  theme(axis.text.x=element_text(size=16, colour="black")) +
  labs(y = "Percentage") +
  theme(axis.text.y=element_text(size=15, colour="black")) +
  theme(axis.title.y=element_text(size=18, colour="black")) +
  #theme(axis.text.y=element_text(size=9)) +
  theme(legend.title = element_text(size=21)) +
  theme(legend.text=element_text(size=16)) +
  labs(fill="      Molecular Function Ontology\n") +
  scale_fill_discrete(labels = c("Unknown", "Transferase", "Hydrolase", "Oxidoreductase", "Ligase", "Chaperone",  "Kinase", "Lyase", "Protease", "Aminoacyl-tRNA synthetase",
                                 "Ribonucleoprotein", "Nucleotidyltransferase", "Elongation Factor", "Helicase", "Ribosomal Protein","Isomerase", "Others"))     

#Poo


# fix legend. 

Pt <- Poo + guides(fill = guide_legend(override.aes = list(size=14), ncol=2))

Pt



