# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies stochastic gradient boosting to the preprocessed dataset.

source('preprocessing.R')

# Stochastic gradient boosting training.
stochastic_gradient_boosting <- caret::train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv", 
                                             number = 10,
                                             classProbs = TRUE), 
                                             metric = "Kappa",
                                             method = "gbm")

# Stochastic gradient boosting testing.
y1_hat <- predict(stochastic_gradient_boosting, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
