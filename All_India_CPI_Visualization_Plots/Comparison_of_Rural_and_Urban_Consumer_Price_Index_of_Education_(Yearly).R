library(dplyr)
library(tidyr)
library(ggplot2)
library(lubridate)

datafile <- datafile %>%
  mutate(Date = as.Date(paste(Year, Month, "01", sep = "-"), format = "%Y-%B-%d"),
         Year = lubridate::year(Date))


education_data <- datafile %>%
  select(Sector, Year, Education)

education_data <- education_data %>%
  group_by(Sector, Year) %>%
  mutate(Education = ifelse(is.na(Education), mean(Education, na.rm = TRUE), Education)) %>%
  ungroup()

rural_urban_education <- education_data %>%
  filter(Sector %in% c("Rural", "Urban"))

rural_urban_education_summary <- rural_urban_education %>%
  group_by(Year, Sector) %>%
  summarise(Avg_CPI = mean(Education, na.rm = TRUE)) %>%
  pivot_wider(names_from = Sector, values_from = Avg_CPI)

ggplot(rural_urban_education_summary, aes(x = Year, y = Rural, color = "Rural")) +
  geom_line() +
  geom_line(aes(y = Urban, color = "Urban")) +
  labs(title = "Comparison of Rural and Urban Consumer Price Index of Education (Yearly)",
       x = "Year", y = "Average CPI") +
  scale_color_manual(values = c("Rural" = "blue", "Urban" = "red")) +
  scale_x_continuous(breaks = seq(min(rural_urban_education_summary$Year),
                                  max(rural_urban_education_summary$Year),
                                  by = 1)) +
  theme_minimal()
