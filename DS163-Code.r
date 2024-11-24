# Install ggplot2 if not already installed
if (!require("ggplot2")) {
  install.packages("ggplot2")
}

# Load ggplot2
library(ggplot2)

# Load the dataset
fat_data <- read.csv("C:/Users/LAB/Desktop/team research/Fat_Supply_Quantity_Data.csv")

# Inspect the data structure to ensure correct loading
str(fat_data)
head(fat_data)

# Ensure columns exist and filter data
filtered_data <- na.omit(fat_data[c("Animal.Products", "Obesity")])

# Check the structure of the filtered data
str(filtered_data)

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



# Scatter Plot with Trendline
ggplot(filtered_data, aes(x = Animal.Products, y = Obesity)) +
  geom_point(color = "red", alpha = 0.7) +
  geom_smooth(method = "lm", color = "blue", se = FALSE) +
  labs(
    title = "Animal Products Supply vs Obesity Rates",
    x = "Animal Products Supply (kg/person/year)",
    y = "Obesity Rate (%)"
  ) +
  theme_minimal()


#Pearson's Correlation Coefficient
# Remove rows with missing values for relevant columns
filtered_data <- na.omit(fat_data[c("Animal.Products", "Obesity")])

# Calculate Pearson's Correlation Coefficient
correlation <- cor(filtered_data$Animal.Products, filtered_data$Obesity, method = "pearson")
print(paste("Pearson's Correlation Coefficient:", round(correlation, 2)))

# Perform hypothesis testing using correlation test
correlation_test <- cor.test(filtered_data$Animal.Products, filtered_data$Obesity, method = "pearson")
print(correlation_test)



