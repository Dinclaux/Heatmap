

#2013-03-08 dinclaux@insa-toulouse.fr

#script to generate a heatmap
#with Rstudio we must enlarge the plots window

#########################################################
### Installing and loading required packages          ###
#########################################################

if (!require("GMD")) {
  install.packages("GMD", dependencies = TRUE)
  library(GMD)
}

#############################################################
### Reading in data and transform it into matrix format   ###
#############################################################


setwd("~/Labo/Données/Script/Heatmap/Heatmap3")
data <- read.csv("exemple.csv", header=T, stringsAsFactors=F,sep=";",dec = ".")
rnames <- data[,1]  # assign labels in column 1 to "rnames"
mat_data <- as.matrix(data[,2:ncol(data)])
rownames(mat_data) <- rnames  # assign row names


#########################################################
### Customizing and plotting the heatmap             ###
#########################################################

heatmap.3(mat_data,
          Rowv = F, # turn off Row clustering
          Colv = F, # turn off column clustering
          dendrogram = "none", # only draw a row or column dendrogram
          scale = "column",
          revR = F,
          revC = T,
          x.center = 2,
          trace = "none",
          tracecol = "black",
          keysize = 1.5,
          main = "Exemple",
          key = TRUE
          )
