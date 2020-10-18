# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies bagged trees to the preprocessed dataset.

source('preprocessing.R')

# Bagged trees training.
bagged_trees <- caret::train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv", 
                             number = 10,
                             classProbs = TRUE), 
                             metric = "Kappa",
                             method = "treebag")

# Bagged trees testing.
y1_hat <- predict(bagged_trees, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
