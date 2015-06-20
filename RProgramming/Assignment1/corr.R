corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  oldDirectory <- setwd(directory)
  files = paste(directory, list.files(pattern="*.csv"), sep="/")
  setwd(oldDirectory)

  #admit defeat, for loop and append...:sadpanda:
  corValues <- c()
  for (file in files) {
    data <- read.csv(file)
    if (sum(complete.cases(data)) > threshold) {
      data <- data[complete.cases(data),]
      corValues <- c(corValues, cor(data$sulfate, data$nitrate))
    }
  }
  corValues
}  