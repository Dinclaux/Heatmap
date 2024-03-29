################################################
### Load libraries                           ###
################################################
library(graphics)
library(grDevices)
# Reinitialize the session
rm(list=ls(all=TRUE))
################################################
### Input the data                           ###
################################################

setwd("~/Labo/Données/Script/Heatmap/Heatmap2")
data <- read.table("Papier1.txt", header=TRUE, stringsAsFactors=FALSE,dec = ",", sep = "\t")

rnames <- data[,1]

################################################
### Customizing and plotting the heat map    ###
################################################

my_palette <- colorRampPalette(c("purple", "yellow", "green"))(n = 100)
col_breaks = c(seq(-1,0,length=200),          # for red
               seq(0,0.8,length=100),         # for yellow
               seq(0.8,1,length=100))         # for green

mat_data <- as.matrix(data[,2:ncol(data)])
rownames(mat_data) <- rnames
heatmap(as.matrix(mat_data), Rowv=NA, Colv=NA, col = my_palette, scale="column", margins=c(6,5),
        xlab = "M?tabolites (mM)", ylab =  "Souches", main = "IP")

