library(dplyr)
library(plotly)

# Assuming your dataset is named 'datafile'
# Ensure 'Year' and 'Clothing' columns are available

clothing_data_mean <- datafile %>%
  group_by(Year, Season) %>%
  summarise(Mean_Clothing = mean(Clothing, na.rm = TRUE))

heatmap_yearly_clothing <- plot_ly(
  data = clothing_data_mean,
  z = ~Mean_Clothing,
  x = ~Year,
  y = ~Season,
  type = "heatmap",
  colorscale = "reds",
  showscale = TRUE
) %>%
  layout(
    scene = list(
      xaxis = list(title = "Year"),
      yaxis = list(title = "Season"),
      zaxis = list(title = "Mean CPI of Clothing")
    ),
    title = "Mean Consumer Price Index of Clothing by Year and Season"
  )

heatmap_yearly_clothing
