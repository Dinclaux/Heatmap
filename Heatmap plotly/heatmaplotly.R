#2016-10-27 dinclaux@insa-toulouse.fr
#new heatmap project with a plotly script



#########################################################
### Installing and loading required packages          ###
#########################################################


if (!require("plotly")) {
  install.packages("plotly", dependencies = TRUE)
  library(plotly)
}

if (!require("htmlwidgets")) {
  install.packages("htmlwidgets", dependencies = TRUE)
  library(htmlwidgets)
}


#############################################################
### Reading in data and transform it into matrix format   ###
#############################################################


setwd("~/Labo/Données/Script/Heatmap/Heatmap plotly")
data <- read.csv(file = "AAC20ULLog2.csv", dec = ",", sep = ";", header = FALSE)

y <- as.list(data[,1])

x<-as.character(round(x = data[1,2:ncol(data)],
                       digits = 2))
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
              zmax = NA,
              zmin = NA,
              y = y,
              x = x,
             yaxis = 1,
              zsmooth = FALSE,
              hoverinfo = "all",
              colorbar = list(yanchor= "middle",
                              showticklabels = TRUE,
                              lenmode = "pixels",
                              title= "Scale",
                              ticks = "outside"))
p<- layout(p,
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

#########################################################
###                  save HTML file                   ###
#########################################################

saveWidget(p, "Heatmap.html")
