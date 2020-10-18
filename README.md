# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

This repository includes the code used in the bachelor's thesis **"Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation"** by Khalil Belghouat.

In this thesis, we apply 12 supervised learning methods on a social exclusion and marginalisation dataset for the purpose of binary classification. We obtained as a result that great importance was attributed to the individual’s mastery of the French language, his ability to secure an internship, as well as his gender in almost all of the utilised supervised learning methods. These variables were, to a large extent, the deciding factors of the person’s social status. As a consequence of the dataset being imbalanced, we used Cohen’s κ to evaluate the performance of each model. We found that random forests, and ensemble methods in general, have outperformed them all while decision trees had the worst out-of-sample performance.

## Prerequisites

The ```R``` programming language, version 4.0.3, and its statistical and machine learning libraries were used to build all applied algorithms. The ```R``` script _packages.R_ in the _packages_ folder installs and loads all necessary ```R``` packages. 

All operations, from data preprocessing to model estimation, were carried out on the Google Colaboratory platform.

## Code Structure



### About The Data 

The data, containing information about the personal, educational, and professional situation of 1,621 individuals, is organized in a table containing 24 columns and 1,621 rows. 22 out of the 24 columns represent exogenous variables such as age, level of education, marital status, etc., while the remaining columns represent the social status of the individuals subject to this study.

### Data Preprocessing

The data contains 22 exogenous variables and 2 endogenous variables. Our study aims, through statistical learning approaches, to identify, amongst the 17 selected exogenous variables, the socioeconomic drivers of our machine learning models and quantify their influence on the target variable of interest, namely, social exclusion.

The ```R``` scripts _preprocessing.R_ in the _preprocessing_ folder passes the social relegation dataset through important data preprocessing steps.

### Model Estimation and Prediction

All models are trained on a training set constituting approximately 80% of the data using k-fold cross-validation. The estimated models are then tested on the remaining 20%.

The ```R``` scripts in the _models_ folder apply the models of interest on to the preprocessed dataset.

### Feature Importance

For any statistical analysis to be successful, the ability to interpret results and explain model outputs is crucial. For this, Shapley values were calculated for all machine learning methods except regression models for which the standard regression analysis procedure is followed to extract the variable effects on the dependent variable.

The ```R``` scripts in the _SHAP_ folder utilizes SHAP (SHapley Additive exPlanations) to explain the output of every machine learning method with the exception of logistic regression and penalized logistic regression.
