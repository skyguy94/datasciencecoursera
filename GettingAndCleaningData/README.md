# Course Project for Getting and Cleaning Data

The R code `run_analysis.R` will do the following:

1. Looks for the data folder and downloads and extracts the data if it doesnt exist
2. Loads all the data and filters it to the desired columns for procesing std and mean.
3. Merges the test and traing datasets into one dataset.
4. Cleans up the dataset column names and factorizes the activity column.
5. Creates a tidy dataset in 'tidy.txt' that computes the mean for each activity and subject.