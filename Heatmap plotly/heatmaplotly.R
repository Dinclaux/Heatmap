#2016-10-27 dinclaux@insa-toulouse.fr
#new heatmap project with a plotly script


# Reinitialize the session
rm(list=ls(all=TRUE))


#########################################################
### Installing and loading required packages          ###
#########################################################


if (!require("plotly")) {
  install.packages("plotly", dependencies = TRUE)
  library(plotly)
}

if (!require("RColorBrewer")) {
  install.packages("RColorBrewer", dependencies = TRUE)
  library(RColorBrewer)
}


#############################################################
### Reading in data and transform it into matrix format   ###
#############################################################


setwd("~/Labo/Données/Script/Heatmap/Heatmap2")
data <- read.table("Papier1.txt", header=TRUE, stringsAsFactors=FALSE,dec = ",", sep = "\t")



col <- brewer.pal(n = 5, name = "YlOrRd")

y <- as.list(data[,1])

x<-colnames(data[,2:ncol(data)])
x <- as.factor(x)

t <- list(
  family = "sans serif",
  size = 12,
  color = toRGB("black")
)

p <- plot_ly(z = as.matrix(data[,2:ncol(data)]),
              type = "heatmap",
              showscale = TRUE, 
              transpose = FALSE,
              zmax = 2,
              zmin = 0,
             y = y,
              x = x,
              yaxis = 1,
              zsmooth = FALSE,
              hoverinfo = "all",
              colorbar = list(yanchor= "middle",
                              showticklabels = TRUE,
                              lenmode = "pixels",
                              title= "Scale",
                              ticks = "outside"),
             colors= col)
p <- layout(p,
            title = "",
            xaxis = list(title = "",
                         showgrid = FALSE,
                         showticklabels = TRUE),
            yaxis = list(title = "",
                         showgrid = FALSE,
                         showticklabels = TRUE,
                         tickangle= 45,
                         tickfont = list(size =9),
                         side ="left"),
            margin = list(autoexpand = TRUE,
                          b = 40, # Sets the bottom margin (in px)
                          i = 20, # Sets the left margin (in px)
                          r = 20, # Sets the right margin (in px)
                          t = 40) # Sets the top margin (in px)
           
)    

  
p
