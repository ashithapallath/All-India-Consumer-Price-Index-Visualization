# Assuming 'datafile' is your dataset
vegetables_data <- datafile[datafile$Sector %in% c("Rural", "Urban") & !is.na(datafile$`Vegetables`), ]

vegetables_data_mean <- vegetables_data %>%
  group_by(Season, Sector) %>%
  summarise(Mean_Vegetables = mean(`Vegetables`, na.rm = TRUE))

heatmap_3d_vegetables_mean <- plot_ly(
  data = vegetables_data_mean,
  z = ~Mean_Vegetables,
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
      zaxis = list(title = "Mean All India CPI of Vegetables")
    ),
    title = "Mean All India Consumer Price Index of Vegetables by Season and Sector"
  )

heatmap_3d_vegetables_mean
