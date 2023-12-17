# Load necessary libraries
library(ggplot2)
library(viridis)

# Assuming your dataset is named 'your_dataset'
your_dataset <- datafile[, c("Cereals and products", "Meat and fish", "Egg", "Milk and products", "Oils and fats",
                             "Fruits", "Vegetables", "Pulses and products", "Sugar and Confectionery", "Spices",
                             "Non-alcoholic beverages", "Prepared meals, snacks, sweets etc.", "Food and beverages",
                             "Pan, tobacco and intoxicants", "Clothing", "Footwear", "Clothing and footwear",
                             "Fuel and light", "Household goods and services", "Health",
                             "Transport and communication", "Recreation and amusement", "Education",
                             "Personal care and effects", "Miscellaneous", "General index")]

# Convert to numeric, handling NAs gracefully and replacing NAs with column means
your_dataset <- apply(your_dataset, 2, function(x) {
  x_numeric <- as.numeric(as.character(x))
  x_numeric[is.na(x_numeric)] <- mean(x_numeric, na.rm = TRUE)
  return(x_numeric)
})

# Calculate the correlation matrix
cor_matrix <- cor(your_dataset, use = "pairwise.complete.obs")

# Convert the correlation matrix to long format
library(tidyr)
cor_matrix_long <- as.data.frame(as.table(cor_matrix))
colnames(cor_matrix_long) <- c("Var1", "Var2", "Correlation")

# Plot the correlation matrix as a heatmap with numeric values
ggplot(cor_matrix_long, aes(x = Var1, y = Var2, fill = Correlation)) +
  geom_tile(color = "white") +
  geom_text(aes(label = sprintf("%.2f", Correlation)), vjust = 1) +  # Add numeric values
  scale_fill_viridis(name = "Correlation", option = "plasma") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
    legend.position = "bottom"
  ) +
  labs(title = "Correlation Matrix")

# Save the plot as a PNG file with larger dimensions
ggsave("correlation_matrix_final.png", plot = last_plot(), width = 16, height = 12, units = "in", dpi = 300, limitsize = FALSE)
