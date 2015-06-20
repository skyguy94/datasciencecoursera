complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
    
  data.id = sprintf("%03d", id)
  data.fileName <- paste(data.id, 'csv', sep=".")
  data.path <- file.path(directory, data.fileName)
  data.loaded <- lapply(data.path, read.csv)
  data.sum <- sapply(data.loaded, function(x) { sum(complete.cases(x)) })
  data.complete <- data.frame(id=data.id, nobs=data.sum)
  data.complete
}