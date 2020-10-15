# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies the support vector machine method with radial basis kernel to the preprocessed dataset.

# Support vector machine with radial basis kernel training.
svm_rbf <- train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv",
                 number = 10,
                 classProbs = TRUE), 
                 metric = "Kappa",
                 method = "svmRadial")

# Support vector machine with radial basis kernel testing.
y1_hat <- predict(svm_rbf, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
