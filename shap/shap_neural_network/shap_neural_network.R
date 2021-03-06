# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script utilizes SHAP (SHapley Additive exPlanations) to explain the output of the neural network.

source('preprocessing.R')
source('neural_network.R')

# Specifying the independent variable columns.
features <- trainset[-30]

# Prediction function.
prediction <- function(object, newdata){
          results <- as.vector(predict(object, newdata, type = "prob"))
          return(results$oui)
}

# Shapley values.
shap <- explain(neural_network, X = features, nsim = 100, pred_wrapper = prediction)

# Mean(|Shapley|).
variable_importance <- autoplot(shap) + theme_bw()
