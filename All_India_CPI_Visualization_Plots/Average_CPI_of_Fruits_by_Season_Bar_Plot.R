library(ggplot2)


datafile$Season <- ifelse(datafile$Month %in% c("December", "January", "February"), "Winter",
                          ifelse(datafile$Month %in% c("March", "April", "May"), "Summer",
                                 ifelse(datafile$Month %in% c( "June", "July", "August"), "Monsoon",
                                        ifelse(datafile$Month %in% c("September", "October", "November"), "Post-Monsoon", NA))))

fruit_data <- datafile[datafile$Sector %in% c("Rural", "Urban") & !is.na(datafile$Season) & !is.na(datafile$`Fruits`), ]

ggplot(fruit_data, aes(x = Season, y = `Fruits`, fill = Sector)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(title = "Average All India Consumer Price Index of Fruits by Season",
       x = "Season",
       y = "Average All India CPI of Fruits") +
  scale_fill_manual(values = c("Urban" = "blue", "Rural" = "green")) +
  theme_minimal()
