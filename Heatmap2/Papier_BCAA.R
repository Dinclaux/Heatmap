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
data <- read.table("M9tot.txt", header=TRUE, stringsAsFactors=FALSE,dec = ",")
rnames <- unique(data[,1] ) # assign labels in column 1 to "rnames"
data<- abs(as.matrix(data[,2:ncol(data)]))
nb <- sum(table((unique(rnames))))
colMax <- function(X) apply(X, 2, max)
data<-scale(data, center=FALSE, scale=colMax(data))
data1<-data[1:nb,]
data2<-data[(nb+1):(nb*2),]
data3<-data[((nb*2)+1):(nb*3),]
data<- cbind(data1,data2,data3)
rownames(data) <- rnames



#########################################################
### Customizing and plotting the heatmap             ###
#########################################################

# custom palette
my_palette <- colorRampPalette(c("white", "darkorange"))(n = 99)
#tmp <- paste("file",".pdf", sep = "")
#win.metafile(file = tmp ,onefile= TRUE)
col_breaks = c(seq(0,0.499,length=50),  
               seq(0.5,1,length=50))

heatmap.2(data3, 
          Rowv = NA, # turn off Row clustering
          Colv = NA, # turn off column clustering
          dendrogram = "none", # only draw a row or column dendrogram
          col = my_palette, # use on color palette defined earlier as default col = heat.colors (500, alpha = 1),
          scale="none",
          trace = "none",
          tracecol = "burlywood4",
          margins=c(8,8), # widens margins around plot
          xlab = "",
          ylab = "Strains",
          main = "M9 + iso + propio",  # heatmap title
          revC =F,
          key.title = "Color Key", # key title
          key.xlab = "Column Z-Score", # X key title
          key.ylab = "", # Y key title
          density.info="density",
          breaks = col_breaks
          )

#dev.off()


