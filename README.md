# Getting and Cleaning Data Course Project
#### By: Santiago Patiño-Giraldo

## Purpose
This repo contains a unique R code to set a tidy data.

## Contains
* README.md: Description of the repo
* Codebook.md : Codes of the dataset
* run_analysis.R : All the R work

## Aproach
These were the steps I followed
1. Download the datafile
2. Unzip the file if it wasn't downoladed before
3. Create a matrix with the column names using the features.txt file
4. Create the dataframe of Test data
* Load x, y and subject test txt files
* Asign activity names to the y_test dataframe
* Create a special factor variable indicating the type of measure "Test"
* Bind all matrices into one testdata dataframe
* Erase the other matrices
5. Create the dataframe of Train data
* Load x, y and subject test txt files
* Asign activity names to the y_train dataframe to create the finaldataset dataframe
* Create a special factor variable indicating the type of measure "Train"
* Bind all matrices into one traindata dataframe
* Erase the other matrices
6. Bind testdata and traindata
7. Subset only the columns with "means" or "std" in the name
8. Erase special characters in the column names
9. Load the dplyr library to the second tidy dataset
10. Use in sequence using %>% the group_by and summarise_if functions in the tidydata vector
