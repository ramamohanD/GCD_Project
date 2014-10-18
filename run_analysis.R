## step 1 - # read all the data (labels, subjects and data) from test and train folders
test_labels <- read.table("test/y_test.txt", col.names="label")
test_subjects <- read.table("test/subject_test.txt", col.names="subject")
test_data <- read.table("test/X_test.txt")
train_labels <- read.table("train/y_train.txt", col.names="label")
train_subjects <- read.table("train/subject_train.txt", col.names="subject")
train_data <- read.table("train/X_train.txt")

# put it together in the format of: subjects, labels, everything else
combine_data <- rbind(cbind(test_subjects, test_labels, test_data),
                      cbind(train_subjects, train_labels, train_data))

## step 2 - # read the features 
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
# only consider features of mean and standard deviation using grep function
features_mean_std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# select only the means and standard deviations from data (+2 - data has subjects and labels)
data_mean_std <- combine_data[, c(1, 2, features_mean_std$V1+2)]

## step 3 - # read the labels (activities)
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
# replace labels in data with label names
data_mean_std$label <- labels[data_mean_std$label, 2]

## step 4 - # first make a list of the current column names and feature names
descvar_names <- c("subject", "label", features_mean_std$V2)
# then tidy that list  - # by removing every non-alphabetic character and converting to lowercase
descvar_names <- tolower(gsub("[^[:alpha:]]", "", descvar_names))
# then use the list as column names for data
colnames(data_mean_std) <- descvar_names

## step 5 - # find the mean for each combination of subject and label
aggr_data <- aggregate(data_mean_std[, 3:ncol(data_mean_std)],
                       by=list(subject = data_mean_std$subject,label = data_mean_std$label), mean)

# write the data for course upload
write.table(format(aggr_data, scientific=T), "tidydata.txt", row.names=F, col.names=F, quote=2)
