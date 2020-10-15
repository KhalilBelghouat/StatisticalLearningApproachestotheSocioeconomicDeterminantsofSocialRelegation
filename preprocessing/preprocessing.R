# SUPPLEMENTARY CODE FOR THE BACHELOR THESIS: 
# Statistical Learning Approaches to the Socioeconomic Determinants of Social Relegation

# This script passes the social relegation data set through important data preprocessing steps.
Applying data preprocessing steps to the social relegation dataset.

# Loading the data.
dataset <- read.csv("SRdata.csv")

# Dropping column variables that aren't subject to our statistical and machine learning study.
dataset <- dataset[ , -which(names(dataset) %in% c("L_espa", "y2", "Prof_M", "Bac_serie", "Diplome2", "classe", "Age"))]

# Specifying which rows and columns contain NA values.
which(is.na(dataset), arr.ind=TRUE)

# The dataset contains categorical variables.
# We replace the missing data at each column by the most frequent column value, i.e., the mode.
# Building the mode function.
Mode <- function(x){
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

dataset$Francais[is.na(dataset$Francais)] <- as.numeric(Mode(dataset["Francais"]))

names <- c('Prof_P', 'Edu_P', 'Ed_M', 'Taille_Frat', 'Francais', 'Age_Tranches')
dataframe[, names] <- lapply(dataframe[, names], as.factor)
fct_dataframe <- as.data.frame(dataframe)

dummy_dataframe <- as.data.frame(predict(dummyVars(~ ., data=fct_dataframe), fct_dataframe))

dummy_dataframe$Genre <- mapvalues(dummy_dataframe$Genre, from = c(1, 2), to = c(0, 1))
dummy_dataframe$Sit_Fami <- mapvalues(dummy_dataframe$Sit_Fami, from = c(1, 2), to = c(0, 1))
dummy_dataframe$R_C <- mapvalues(dummy_dataframe$R_C, from = c(1, 2), to = c(0, 1))
dummy_dataframe$R_B <- mapvalues(dummy_dataframe$R_B, from = c(1, 2), to = c(0, 1))
dummy_dataframe$Etablissemen <- mapvalues(dummy_dataframe$Etablissemen, from = c(1, 2), to = c(0, 1))
dummy_dataframe$Stage <- mapvalues(dummy_dataframe$Stage, from = c(1, 2), to = c(0, 1))
dummy_dataframe$Con_Pratiques <- mapvalues(dummy_dataframe$Con_Pratiques, from = c(1, 2), to = c(0, 1))
dummy_dataframe$Con_informatique <- mapvalues(dummy_dataframe$Con_informatique, from = c(1, 2), to = c(0, 1))
dummy_dataframe$Con_Commu <- mapvalues(dummy_dataframe$Con_Commu, from = c(1, 2), to = c(0, 1))
dummy_dataframe$L_anglais <- mapvalues(dummy_dataframe$L_anglais, from = c(1, 2), to = c(0, 1))	
