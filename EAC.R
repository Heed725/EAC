#***************************************************************************************************************************************#
   #@725Hemed 
    #EAC CODE 2 
    #Due Before New year eve  
#****************************************************************************************************************************************#
#The Main Code
library(rgeoboundaries)
 EAC_boundaries <- geoboundaries(c("Tanzania", "Kenya","Uganda","Rwanda","Burundi","South Sudan","Democratic republic of Congo"))
library(ggplot2)
  ggplot(data = EAC_boundaries) +
   geom_sf() +
 #Label X and Y axis as Longitude and Latitude
    xlab("Longitude") +
    ylab("Latitude") + 
#Title of Diagram
    ggtitle("East africa community")
  
#*****************************************************************************************************************************************#