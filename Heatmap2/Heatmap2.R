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

setwd("~/Labo/Données/Script/Heatmap/Heatmap2")
data <- read.table("Papier2.txt", header=TRUE, stringsAsFactors=FALSE,dec = ",", sep = "\t")

rnames <- unique(data[,1] ) # assign labels in column 1 to "rnames"
data<- abs(as.matrix(data[,2:ncol(data)]))
nb <- sum(table((unique(rnames))))
colMax <- function(X) apply(X, 2, max)

rownames(data) <- rnames



#########################################################
### Customizing and plotting the heatmap             ###
#########################################################

# custom palette


my_palette <- colorRampPalette(c( "#0D73AE", "#ffffff","#AE0D0D"))(n = 9)
#tmp <- paste("file",".pdf", sep = "")
#win.metafile(file = tmp ,onefile= TRUE)
col_breaks = c(0,0.2,0.4,0.65,0.85,1.15,1.35,1.6,1.8,2)

heatmap.2(data, 
          Rowv = NA, # turn off Row clustering
          Colv = NA, # turn off column clustering
          dendrogram = "none", # only draw a row or column dendrogram
          col = my_palette, # use on color palette defined earlier as default col = heat.colors (500, alpha = 1),
          scale="none",
          trace = "none",
          tracecol = NA,
          margins=c(10,10), # widens margins around plot
          xlab = "",
          ylab = "Flux",
          main = "test",  # heatmap title
          revC =T,
          key.title = "", # key title
          key.xlab = "", # X key title
          key.ylab = "", # Y key title
          density.info="density",
          breaks = col_breaks)
          
#dev.off()
