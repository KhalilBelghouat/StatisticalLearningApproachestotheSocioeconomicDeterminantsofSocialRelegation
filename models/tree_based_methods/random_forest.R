# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies random forest to the preprocessed dataset.

# Random forest training.
random_forest <- train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv", 
                       number = 10,
                       classProbs = TRUE), 
                       metric = "Kappa",
                       method = "rf")

# Random forest training.
y1_hat <- predict(random_forest, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
