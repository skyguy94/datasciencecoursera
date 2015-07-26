zipFile <- "data.zip"
if (!file.exists(zipFile)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipFile)
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

activities <- read.table('UCI HAR Dataset/activity_labels.txt')
activities[,2] <- as.character(activities[,2])

features <- read.table('UCI HAR Dataset/features.txt')
features[,2] <- as.character(features[,2])

features.filtered <- grep(".*mean.*|.*std.*", features[,2])
features.names <- features[features.filtered, 2]
features.names <- gsub('-mean', 'Mean', features.names)
features.names <- gsub('-std', 'Std', features.names)
features.names <- gsub('[-()]', '', features.names)

raw.train.subject <- read.table('UCI HAR Dataset/train/subject_train.txt')
raw.train.x <- read.table('UCI HAR Dataset/train/x_train.txt')[features.filtered]
raw.train.y <- read.table('UCI HAR Dataset/train/y_train.txt')
raw.test.subject <- read.table('UCI HAR Dataset/test/subject_test.txt')
raw.test.x <- read.table('UCI HAR Dataset/test/x_test.txt')[features.filtered]
raw.test.y <- read.table('UCI HAR Dataset/test/y_test.txt')

data.training <- cbind(raw.train.subject, raw.train.y, raw.train.x)
data.test <- cbind(raw.test.subject, raw.test.y, raw.test.x)

data <- rbind(data.training, data.test)
colnames(data) <- c("subject", "activity", features.names)

tidy <- aggregate(. ~subject + activity, data, mean)
tidy <- tidy[order(tidy$subject,tidy$activity),]

features.names <- gsub("^t", "time", features.names)
features.names <- gsub("^f", "frequency", features.names)
features.names <- gsub("Acc", "Accelerometer", features.names)
features.names <- gsub("Gyro", "Gyroscope", features.names)
features.names <- gsub("Mag", "Magnitude", features.names)
features.names <- gsub("BodyBody", "Body", features.names)
colnames(tidy) <- c('subject', 'activity', features.names)

write.table(tidy, 'tidy.txt', row.names=FALSE, quote=FALSE)