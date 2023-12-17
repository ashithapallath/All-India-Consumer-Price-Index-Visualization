library(dplyr)
library(readr)

datafile <- read_csv("C://Users//mariy//Downloads//datafile1.csv") %>%
  mutate(Date = as.Date(paste(Year, Month, "01", sep = "-"), format = "%Y-%B-%d"))

datafile <- datafile %>%
  filter(!(Month == "April" & Year == 2020))

education_data <- datafile %>%
  select(Sector, Date, Education)

rural_urban_education <- education_data %>%
  filter(Sector %in% c("Rural", "Urban"))

library(ggplot2)

ggplot(rural_urban_education, aes(x = Date, y = Education, color = Sector)) +
  geom_line() +
  labs(title = "Comparison of Rural and Urban Consumer Price Index of Education",
       x = "Date", y = "CPI") +
  scale_x_date(date_labels = "%b %Y", date_breaks = "1 month") +
  theme_minimal()
