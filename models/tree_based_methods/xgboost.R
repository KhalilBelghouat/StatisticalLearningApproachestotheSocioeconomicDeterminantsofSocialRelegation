# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies the xgboost algorithm to the preprocessed dataset.

# Xgboost training.
xgboost <- train(factor(y1) ~ ., data = trainset, trControl = trainControl(method = "cv", 
                 number = 10,
                 classProbs = TRUE), 
                 metric = "Kappa",
                 method = "xgbTree")

# Xgboost testing.
y1_hat <- predict(xgboost, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
