install.packages("data.table", repos='http://cran.us.r-project.org')
library(data.table)

# Read command-line arguments for the input CSV file path and output CSV file path
args <- commandArgs(trailingOnly=TRUE)
csv_file_path <- args[1]
output_file_path <- args[2]

# Load the CSV file
data <- read.csv(csv_file_path)

# Perform linear regression
model <- lm(Y ~ X, data=data)

# Extract the slope and intercept
slope <- coef(model)[2]
intercept <- coef(model)[1]

# Create a data frame with the results
results <- data.frame(Slope = slope, Intercept = intercept)

# Save the results to a CSV file
write.csv(results, output_file_path, row.names = FALSE)
