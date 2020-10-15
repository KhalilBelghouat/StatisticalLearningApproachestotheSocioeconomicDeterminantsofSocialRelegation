# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script passes the social relegation data set through important data preprocessing steps.

set.seed(10)

# Loading the data.
dataset <- read.csv("SRdata.csv")

# Dropping column variables that aren't subject to our statistical and machine learning study.
dataset <- dataset[ , -which(names(dataset) %in% c("L_espa", "y2", "Prof_M", "Bac_serie", "Diplome2", "classe", "Age"))]

# Specifying which rows and columns contain NA values.
which(is.na(dataset), arr.ind=TRUE)

# The dataset contains categorical variables.
# We replace the missing data at each column by the most frequent column value, i.e., the mode.

# Building the mode function.
mode <- function(x){
    ta = table(x)
    tam = max(ta)
    if (all(ta == tam))
         mod = NA
    else
         if(is.numeric(x))
    mod = as.numeric(names(ta)[ta == tam])
    else
         mod = names(ta)[ta == tam]
    return(mod)
}

# Replacing the NA values in "Francais" column with its mode.
dataset$Francais[is.na(dataset$Francais)] <- as.numeric(mode(dataset["Francais"]))

# All column variables are encoded as integers.
# We encode the categorical variables with k > 2 levels as factors.
# fct, i.e., factors, is R's way of differentiating categorical from numerical variables.

# We select the columns of concern and apply the transformation.
colnames <- c('Prof_P', 'Edu_P', 'Ed_M', 'Taille_Frat', 'Francais', 'Age_Tranches')
dataset[, colnames] <- lapply(dataset[, colnames], as.factor)
fct_dataset <- as.data.frame(dataset)

# Transforming categorical variables into dummy variables.
dummy_dataset <- as.data.frame(predict(dummyVars(~ ., data=fct_dataset), fct_dataset))

# We apply binary encoding to the categorical variables that weren't affected by earlier encoding.
dummy_dataset$Genre <- mapvalues(dummy_dataset$Genre, from = c(1, 2), to = c(0, 1))
dummy_dataset$Sit_Fami <- mapvalues(dummy_dataset$Sit_Fami, from = c(1, 2), to = c(0, 1))
dummy_dataset$R_C <- mapvalues(dummy_dataset$R_C, from = c(1, 2), to = c(0, 1))
dummy_dataset$R_B <- mapvalues(dummy_dataset$R_B, from = c(1, 2), to = c(0, 1))
dummy_dataset$Etablissemen <- mapvalues(dummy_dataset$Etablissemen, from = c(1, 2), to = c(0, 1))
dummy_dataset$Stage <- mapvalues(dummy_dataset$Stage, from = c(1, 2), to = c(0, 1))
dummy_dataset$Con_Pratiques <- mapvalues(dummy_dataset$Con_Pratiques, from = c(1, 2), to = c(0, 1))
dummy_dataset$Con_informatique <- mapvalues(dummy_dataset$Con_informatique, from = c(1, 2), to = c(0, 1))
dummy_dataset$Con_Commu <- mapvalues(dummy_dataset$Con_Commu, from = c(1, 2), to = c(0, 1))
dummy_dataset$L_anglais <- mapvalues(dummy_dataset$L_anglais, from = c(1, 2), to = c(0, 1))	

# Schuffling the data.
rows <- sample(nrow(dummy_dataset))
dummy_dataset <- dummy_dataset[rows, ]
dummy_dataset$y1 <- revalue(factor(dummy_dataset$y1), c("0"="non", "1"="oui"))
head(dummy_dataset)
