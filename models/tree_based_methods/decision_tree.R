# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies the decision tree algorithm to the preprocessed dataset.

# Decision tree training.
decision_tree <- train(factor(y1)~., data=trainset, trControl=trainControl(method="cv", 
                       number = 10,
                       classProbs = TRUE), 
                       metric = "Kappa",
                       method = "rpart")

# Decision tree testing.
y1_hat <- predict(decision_tree, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
