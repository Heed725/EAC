library(rgeoboundaries)
library(ggplot2)
library(dplyr)
library(sf)

# List of EAC countries including Somalia
countries <- c("Tanzania", "Kenya", "Uganda", "Rwanda", "Burundi", "South Sudan", 
               "Democratic Republic of Congo", "Somalia")

# Fetch boundaries for each country and add a column with the country name
EAC_boundaries <- bind_rows(lapply(countries, function(cntry) {
  boundary <- geoboundaries(cntry)
  boundary$country <- cntry  # Add country name column
  return(boundary)
}))

# Plot using ggplot2 with different colors for each country
ggplot(data = EAC_boundaries) +
  geom_sf(aes(fill = country), color = "black") +  # Assign unique colors
  scale_fill_manual(values = c("Tanzania" = "#1f78b4", "Kenya" = "#33a02c", "Uganda" = "#e31a1c", 
                               "Rwanda" = "#ff7f00", "Burundi" = "#6a3d9a", "South Sudan" = "#b15928", 
                               "Democratic Republic of Congo" = "#a6cee3", "Somalia" = "#b2df8a")) +  
  xlab("Longitude") +
  ylab("Latitude") + 
  ggtitle("East Africa Community (Colorful Map)") +
  theme_minimal() +  
  theme(legend.title = element_blank())  # Remove legend title

