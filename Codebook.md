## Codebook
####By: Santiago Patiño-Giraldo

The run_analysis.R file creates two dataframes: finaldataset and tidydata.

##finaldataset
###Type of measure: 
* Class: Factor 
* Levels: Two=Train and Test. 
* Description: Show where were the original data in the test or train dataset

###subjectid
* Class: Factor 
* Levels: 30 
* Description: Subject id of the measure

###activity
* Class: Factor 
* Levels: Six. [1] "Walking" "Walking Upstairs" "Walking Downstairs" "Sitting" "Standing" "Laying" 
* Description: Type of activity of the measure

###Note
Columns 4:89 correspond of means and std of each measure in the original dataset

###tidydata 
###subjectid
* Class: Factor 
* Levels: 30 
* Description: Subject id of the measure

###activity
* Class: Factor 
* Levels: Six. [1] "Walking" "Walking Upstairs" "Walking Downstairs" "Sitting" "Standing" "Laying" 
* Description: Type of activity of the measure

###Note
Columns 3:88 correspond of mean of each subject and each activity of the numerical columns in the finaldataset
