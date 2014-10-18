GCD_Project
===========

##Peer Assessment  - Getting and Cleaning Data Course Project

###Files in this repo

- README.md -- Description of the script how it works
- CodeBook.md -- Description of variables in the data
- run_analysis.R -- Analysis code (R code)

###Analysis goals

- Merges the training and the test sets to create one data set.
-	Extracts only the measurements on the mean and standard deviation for each measurement.
-	Uses descriptive activity names to name the activities in the data set
-	Appropriately labels the data set with descriptive activity names.
-	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###path to run the script

The code will run in a folder of the Samsung data (UCI HAR Dataset).
The script assumes it has in its working directory the following files and folders:

- activity_labels.txt
-	features.txt
-	test folder
-	train folder

The output is created in working directory with the name of tidydata.txt

###steps followed

**Step 1:**

-  read all the data (labels, subjects and data) from test and train folders and combine the files to a data frame in the form of subjects, labels, rest of the data.

**Step 2:**

-  Read the features from features.txt and filter it to only leave features that are either (mean or standard deviation). A new data frame is then created that includes subjects, labels and the described features.

**Step 3:**

-	Read the activity labels from activity_labels.txt and replace the numbers with the text.

**Step 4:**

-	Make a column list (including "subjects" and "label" at the start). Transform the list by removing all non-alphanumeric characters and converting the result to lowercase and apply the desc-column names to the data frame

**Step 5:**

-	Create a new data frame by finding the mean for each combination of subject and label. 

**Final step:**

-	Write the new tidy set into a text file called tidydata.txt.

###Reproducibility of code

-	Download the data source and put into a folder on your local drive. You'll have a UCI HAR Datasetfolder.
-	Put `run_analysis.R` in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.
-	Run source(`run_analysis.R`), then it will generate a new file tidydata.txt in your working directory.
