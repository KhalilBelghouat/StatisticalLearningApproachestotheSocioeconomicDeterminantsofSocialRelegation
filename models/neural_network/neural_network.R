# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies a neural network to the preprocessed dataset.

source('preprocessing.R')

# Neural network training.
neural_network <- caret::train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv",
                               number = 10,
                               classProbs = TRUE),
                               tuneGrid = expand.grid(layer1 = 25,
                                                      layer2 = 25,
                                                      layer3 = 25), 
                               metric = "Kappa",
                               method = "mlpML")

# Neural network testing.
y1_hat <- predict(neural_network, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
