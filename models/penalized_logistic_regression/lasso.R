# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script applies lasso logistic regression to the preprocessed dataset.

# Transforming the data columns into factors.
fct_dataset <- as.data.frame(lapply(dataset, as.factor))

# Splitting the data into a tarining and testing set.
trainset <- fct_dataset[1:1300,]
testset <- fct_dataset[1301:1621,]

# Lasso logistic regression training.
lasso <- train(y1 ~ ., data = trainset, trControl = trainControl(method = "cv", 
               number = 10),
               method = "glmnet",
               family = "binomial",
               metric = "Kappa",
               tuneGrid = expand.grid(alpha = 1,
               lambda = seq(0.01, 0.1, by = 0.001)))

# Lasso logistic regression testing.
y1_hat <- predict(lasso, as.data.frame(testset)[-30])
confusionMatrix(y1_hat, as.factor(as.data.frame(testset)$y1))
