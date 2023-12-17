library(ggplot2)
library(dplyr)
library(plotly)

datafile$Season <- ifelse(datafile$Month %in% c("December", "January", "February"), "Winter",
                          ifelse(datafile$Month %in% c("March", "April", "May"), "Summer",
                                 ifelse(datafile$Month %in% c( "June", "July", "August"), "Monsoon",
                                        ifelse(datafile$Month %in% c("September", "October", "November"), "Post-Monsoon", NA))))

fruit_data <- datafile[datafile$Sector %in% c("Rural", "Urban") & !is.na(datafile$`Fruits`), ]

fruit_data_mean <- fruit_data %>%
  group_by(Season, Sector) %>%
  summarise(Mean_Fruits = mean(`Fruits`, na.rm = TRUE))

heatmap_3d_mean <- plot_ly(
  data = fruit_data_mean,
  z = ~Mean_Fruits,
  x = ~Season,
  y = ~Sector,
  type = "heatmap",
  colorscale = "reds",  
  showscale = TRUE
) %>%
  layout(
    scene = list(
      xaxis = list(title = "Season"),
      yaxis = list(title = "Sector"),
      zaxis = list(title = "Mean All India CPI of Fruits")
    ),
    title = "Mean All India Consumer Price Index of Fruits by Season and Sector"
  )

heatmap_3d_mean
