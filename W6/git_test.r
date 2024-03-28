print("helloworld")
##  UCI MLR
## https://github.com/Prometheus77/ucimlr
install.packages("devtools")
 # will load the dataset "Adult" located at https://archive.ics.uci.edu/ml/machine-learning-databases/adult/

library(ucimlr)
ds <- read_ucimlr("adult")
head(ds)

## UCI DATA
## https://github.com/coatless-rpkg/ucidata?tab=readme-ov-file

# install.packages("remotes")
remotes::install_github("coatless-rpkg/ucidata")
library("ucidata")


# Classification using Random Forest
library(tidyverse)

# Split the dataset into training and testing sets
set.seed(123)
train_indices <- sample(1:nrow(ds), 0.7 * nrow(ds))
train_data <- ds[train_indices, ]
test_data <- ds[-train_indices, ]

# Train the Random Forest model
model <- randomForest::randomForest(income ~ ., data = train_data, ntree = 100)

# Make predictions on the test set
predictions <- predict(model, newdata = test_data)

# Calculate accuracy
accuracy <- sum(predictions == test_data$income) / nrow(test_data)

# Calculate precision, recall, and F1-score
confusion_matrix <- table(predictions, test_data$income)
precision <- confusion_matrix[2, 2] / sum(confusion_matrix[, 2])
recall <- confusion_matrix[2, 2] / sum(confusion_matrix[2, ])
f1_score <- 2 * (precision * recall) / (precision + recall)

# Print the results
cat("Accuracy:", accuracy, "\n")
cat("Precision:", precision, "\n")
cat("Recall:", recall, "\n")
cat("F1-score:", f1_score, "\n")