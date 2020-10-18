# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies the decision tree algorithm to the preprocessed dataset.

source('preprocessing.R')

# Decision tree training.
decision_tree <- caret::train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv", 
                              number = 10,
                              classProbs = TRUE), 
                              metric = "Kappa",
                              method = "rpart")

# Decision tree testing.
y1_hat <- predict(decision_tree, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
