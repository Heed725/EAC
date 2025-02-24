# East African Community (EAC)

## Overview
The **East African Community (EAC)** is a regional intergovernmental organization comprising eight countries in East Africa. The EAC promotes economic integration, trade, and political cooperation among its member states. The member countries include:

- **Tanzania**
- **Kenya**
- **Uganda**
- **Rwanda**
- **Burundi**
- **South Sudan**
- **Democratic Republic of Congo (DRC)**
- **Somalia** (newest member)

The EAC aims to establish a common market, a monetary union, and eventually a political federation to enhance regional stability and development.

<img width="1500" alt="EAC" src="https://github.com/user-attachments/assets/a482c8f2-614c-49e1-8235-9e2ddf955d8a" />

## Visualizing EAC Boundaries in R
The following R script uses the `rgeoboundaries` package to fetch and visualize the geographic boundaries of the EAC member states. The `ggplot2` library is used to create a colorful map of the region.

### **R Code to Generate EAC Map**

```r
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
```

### **Explanation of the Code**
1. **Load Required Packages**: The script loads `rgeoboundaries`, `ggplot2`, `dplyr`, and `sf` for spatial data processing and visualization.
2. **Define EAC Member States**: A list of EAC countries (including Somalia) is created.
3. **Fetch Country Boundaries**: The `geoboundaries()` function is used to retrieve the geographic boundaries of each country.
4. **Merge Boundaries**: The `bind_rows()` function combines all country boundary datasets into one.
5. **Create the Map**: The `ggplot2` package is used to generate a map where each country is filled with a different color.
6. **Improve Visualization**: A manual color scale is applied, and the theme is set to minimal for better aesthetics.

## **Conclusion**
This script provides a simple way to visualize the geographical boundaries of the **East African Community (EAC)** in R. The colorful representation helps distinguish each country, making it useful for presentations, research, and policy analysis.

