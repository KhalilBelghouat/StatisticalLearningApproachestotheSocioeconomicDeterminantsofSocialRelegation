# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies the XGBoost algorithm to the preprocessed dataset.

# XGBoost training.
XGBoost <- train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv", 
                 number = 10,
                 classProbs = TRUE), 
                 metric = "Kappa",
                 method = "xgbTree")

# XGBoost testing.
y1_hat <- predict(XGBoost, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
