library(ggplot2)
library(ggmap)
library(ggrepel)
library(ggsn)
library(RColorBrewer)

#set working directory 
setwd("C:/Users/Danielle.Perez/Documents/R/Maps/Light traps")

#load site locations
Sites <- read.csv("C:/Users/Danielle.Perez/Documents/R/Maps/Light traps/2019lighttraplocations.csv")


#Create map
#set.seed(2)
Sites_stamenMap <- get_stamenmap(bbox=c(-123.9, 47.1, -121.8, 49), maptype = "terrain-background",zoom = 9)
ggmap(Sites_stamenMap) +
  geom_point(aes(Longitude, Latitude, color = SiteName), data = Sites, size = 3, position = position_jitter(h = 0.02, w = 0.02)) +
  #scale_color_brewer(palette = "Set1") +
  geom_label_repel(data = Sites, aes(x = Longitude, y = Latitude, label = SiteCode), 
                   size = 3)
  
  scalebar(x.min = -121.8, x.max = -123.9, y.min = 47.1, y.max = 49,
           location = "bottomleft", dist = 50, dist_unit = 'km', transform = TRUE, model = 'WGS84')



  
  