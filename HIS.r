# Load libraries
library(ggplot2)

# Load the dataset
data <- read.csv("Path_to_Your_File/Fat_Supply_Quantity_Data.csv")

# Remove rows with missing values in relevant columns
filtered_data <- na.omit(data[c("Animal.Products", "Obesity")])

# Histogram for Animal Products Supply
ggplot(filtered_data, aes(x = Animal.Products)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black", alpha = 0.7) +
  labs(
    title = "Distribution of Animal Products Supply",
    x = "Animal Products Supply (kg/person/year)",
    y = "Frequency"
  ) +
  theme_minimal()

# Histogram for Obesity Rates
ggplot(filtered_data, aes(x = Obesity)) +
  geom_histogram(binwidth = 5, fill = "green", color = "black", alpha = 0.7) +
  labs(
    title = "Distribution of Obesity Rates",
    x = "Obesity Rate (%)",
    y = "Frequency"
  ) +
  theme_minimal()
