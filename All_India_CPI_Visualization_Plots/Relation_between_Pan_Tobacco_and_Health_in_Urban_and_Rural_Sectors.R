library(ggplot2)


urban_data <- subset(datafile, Sector == "Urban")
rural_data <- subset(datafile, Sector == "Rural")

ggplot() +
  geom_point(data = urban_data, aes(x = `Pan, tobacco and intoxicants`, y = Health, color = "Urban"), size = 3, alpha = 0.7) +
  geom_point(data = rural_data, aes(x = `Pan, tobacco and intoxicants`, y = Health, color = "Rural"), size = 3, alpha = 0.7) +
  geom_smooth(data = urban_data, aes(x = `Pan, tobacco and intoxicants`, y = Health, color = "Urban"), method = "lm", se = FALSE) +
  geom_smooth(data = rural_data, aes(x = `Pan, tobacco and intoxicants`, y = Health, color = "Rural"), method = "lm", se = FALSE) +
  labs(x = "Pan, Tobacco, and Intoxicants", y = "Health", title = "Relation between Pan, Tobacco, and Health in Urban and Rural Sectors") +
  scale_color_manual(values = c("Urban" = "blue", "Rural" = "green"), labels = c("Urban", "Rural")) +
  theme_minimal() +
  theme(legend.position = "top")

