# Box plot for comparison between rural and urban CPI in a specific sector
ggplot(datafile[datafile$Sector %in% c("Rural", "Urban"), ], aes(x = Sector, y = `Meat and fish`, fill = Sector)) +
  geom_boxplot() +
  labs(title = "Box Plot of CPI for Meat and Fish (Rural vs Urban)",
       x = "Sector",
       y = "CPI for Meat and Fish") +
  scale_fill_manual(values = c("Urban" = "blue", "Rural" = "green")) +
  theme_minimal()
