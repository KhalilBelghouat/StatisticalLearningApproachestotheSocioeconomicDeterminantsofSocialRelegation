# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies the support vector machine method with polynomial kernel to the preprocessed dataset.

# Support vector machine with polynomial kernel training.
svm_poly <- train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv",
                  number = 10,
                  classProbs = TRUE), 
                  metric = "Kappa",
                  method = "svmPoly")

# Support vector machine with polynomial kernel testing.
y1_hat <- predict(svm_poly, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
