#2013-03-08 dinclaux@insa-toulouse.fr

#script to generate a heatmap
#with Rstudio we must enlarge the plots window

# Reinitialize the session
rm(list=ls(all=TRUE))

#########################################################
### Installing and loading required packages          ###
#########################################################

if (!require("gplots")) {
  install.packages("gplots", dependencies = TRUE)
  library(gplots)
}
if (!require("RColorBrewer")) {
  install.packages("RColorBrewer", dependencies = TRUE)
  library(RColorBrewer)
}

#############################################################
### Reading in data and transform it into matrix format   ###
#############################################################

setwd("~/Labo/Données/Script/Heatmap2")
data <- read.table("CoA_propionyl.txt", header=T, stringsAsFactors=F,dec = ",")
rnames <- data[,1]  # assign labels in column 1 to "rnames"
mat_data <- as.matrix(data[,2:ncol(data)])
rownames(mat_data) <- rnames  # assign row names



#########################################################
### Customizing and plotting the heatmap             ###
#########################################################

# custom palette
my_palette <- colorRampPalette(c("white", "darkorange"))(n = 20)

# plot Heatmap
heatmap.2(mat_data, 
          Rowv = NA, # turn off Row clustering
          Colv = NA, # turn off column clustering
          dendrogram = "none", # only draw a row or column dendrogram
          col = my_palette, # use on color palette defined earlier as default col = heat.colors (500, alpha = 1),
          scale="none",
          trace = "none",
          tracecol = "burlywood4",
          margins=c(10,10), # widens margins around plot
          xlab = "Métabolites (mM)",
          ylab = "Souches",
          main = "Exemple",  # heatmap title
          revC =T,
          
          # color key + density info
          key = TRUE, 
          keysize = 1,
          key.title = "Color Key", # key title
          key.xlab = "Column Z-Score", # X key title
          key.ylab = "", # Y key title
          density.info="density", 
          lmat=rbind( c(0, 3, 4), c(2,1,1 ) ), lwid=c(0.1, 4, 4 ),
          symkey = F
)

#########################################################
### save pdf file                                     ###
#########################################################  

#dev.copy2pdf(width = 20, height = 15, file="heatmap.pdf")
