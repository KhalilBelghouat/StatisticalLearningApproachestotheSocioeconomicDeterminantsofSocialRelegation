# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

This repository includes the code used in the Bachelor Thesis **"Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation"** by Khalil Belghouat.

In this thesis, we apply 12 supervised learning methods on a social exclusion and marginalisation dataset for the purpose of binary classification. We obtained as a result that great importance was attributed to the individual’s mastery of the french language, his ability to secure an internship, as well as his gender in almost all of the utilised supervised learning methods. These variables were to a large extent the deciding factors of the person’s social status. As a consequence of the dataset being imbalanced, we used Cohen’s κ to evaluate the performance of each model. We found that random forests, and ensemble methods in general, have outperformed them all while decision trees had the worst out-of-sample performance.

## Prerequisites

The ```R``` programming language, version 4.0.3, and its statistical and machine learning libraries were used to build all applied algorithms. The ```R``` script _packages.R_ in the _packages_ folder installs and loads all necessary ```R``` packages. 

All operations, from data preprocessing to model estimation, were carried out on the Google Colaboratory platform.

## Code Structure



### About The Data 

The data, containing information about the personal, educational, and professional situation of 1,621 individuals, are organized in a table containing 17 columns and 1,621 rows. The first 16 columns represent exogenous variables such as age, level of education, marital status, etc., while the last column represents the social status of the concerned individual where 0 denotes his non-exclusion and 1 denotes his exclusion.

### Data Preprocessing



### Model Estimation and Prediction



### Feature Importance

