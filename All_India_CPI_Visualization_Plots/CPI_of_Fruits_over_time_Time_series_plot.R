library(ggplot2)


datafile$Season <- ifelse(datafile$Month %in% c("December", "January", "February"), "Winter",
                          ifelse(datafile$Month %in% c("March", "April", "May"), "Summer",
                                 ifelse(datafile$Month %in% c( "June", "July", "August"), "Monsoon",
                                        ifelse(datafile$Month %in% c("September", "October", "November"), "Post-Monsoon", NA))))

fruit_data <- datafile[datafile$Sector %in% c("Rural", "Urban") & !is.na(datafile$Season) & !is.na(datafile$`Fruits`), ]

ggplot(fruit_data, aes(x = as.Date(paste("01", Month, Year), format="%d %B %Y"), y = `Fruits`, color = Sector)) +
  geom_line(size = 1) +
  labs(title = "All India Consumer Price Index of Fruits Over Time",
       x = "Date",
       y = "All India CPI of Fruits") +
  scale_x_date(date_labels = "%b %Y", date_breaks = "1 year") +
  facet_wrap(~Season, scales = "free_y", ncol = 1) +
  theme_minimal()

