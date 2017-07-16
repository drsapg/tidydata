#Download the file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!dir.exists("dataset"))
{
download.file(fileurl,"dataset.zip")
unzip(zipfile = "dataset.zip",exdir = "dataset")
}

# variable of colnames
columnames <- read.table(file=paste0(getwd(),"/dataset/UCI HAR Dataset/features.txt"),header=FALSE, col.names = c("varnumber","columname"))

# Variables names to lowercase
columnames$columname <- tolower(columnames$columname)

# Dataframes of testdata
# Measures
testdatax <- read.table(file=paste0(getwd(),"/dataset/UCI HAR Dataset/test/X_test.txt"),header=FALSE)

#Assign tidy colnames
names(testdatax) <- columnames$columname

# Type of activity
testdatay <- read.table(file=paste0(getwd(),"/dataset/UCI HAR Dataset/test/y_test.txt"),header=FALSE,
                         colClasses = "factor",col.names = "activity")
levels(testdatay$activity) <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")

# Subject observation
testdatas <- read.table(file=paste0(getwd(),"/dataset/UCI HAR Dataset/test/subject_test.txt"),header=FALSE,colClasses = "factor",
                         col.names = "subjectid")

typeofmeasure <- matrix(data = rep("Test",times=length(testdatas$subjectid)),ncol = 1)

# Merging to a final dataset
testdata <- cbind(typeofmeasure,testdatas,testdatay,testdatax)
rm(testdatas)
rm(testdatay)
rm(testdatax)
rm(typeofmeasure)

#dataframe of traindata
# Measures
traindatax <- read.table(file=paste0(getwd(),"/dataset/UCI HAR Dataset/train/X_train.txt"),header=FALSE)

#Assign tidy colnames
names(traindatax) <- columnames$columname

# Type of activity
traindatay <- read.table(file=paste0(getwd(),"/dataset/UCI HAR Dataset/train/y_train.txt"),header=FALSE,
                        colClasses = "factor",col.names = "activity")
levels(traindatay$activity) <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")

# Subject observation
traindatas <- read.table(file=paste0(getwd(),"/dataset/UCI HAR Dataset/train/subject_train.txt"),header=FALSE,colClasses = "factor",
                        col.names = "subjectid")

# Create a row of type of measure
typeofmeasure <- matrix(data = rep("Train",times=length(traindatas$subjectid)),ncol = 1)

# Merging to a final dataset
traindata <- cbind(typeofmeasure,traindatas,traindatay,traindatax)
rm(traindatas)
rm(traindatay)
rm(traindatax)
rm(typeofmeasure)

#Merge to a unique dataset
finaldataset <- rbind(traindata,testdata)

#Subsetting only the "means" and "std" columns
finaldataset <- cbind(finaldataset[,1:3],finaldataset[,grep(".mean.|.std.",names(finaldataset))])

# Erasing specialcharacters (()_-,) to create appropiate descriptive labels of column names
names(finaldataset) <- gsub("-","",x = names(finaldataset))
names(finaldataset) <- gsub("\\(","",x = names(finaldataset))
names(finaldataset) <- gsub("\\)","",x = names(finaldataset))
names(finaldataset) <- gsub(",","",x = names(finaldataset))

View(finaldataset)
# Tidy dataframe
library(dplyr)

tidydata <- group_by(finaldataset,subjectid,activity) %>%
            summarise_if(is.numeric,funs(mean))

View(tidydata)