best <- function(state, outcome) {  
  data.raw <- read.csv("outcome-of-care-measures.csv", na.string="Not Available", stringsAsFactors=FALSE)

  if (!(state %in% data.raw[, 7])) {
    stop('invalid state')
  }
  
  if (outcome == "heart attack") {
    column <- 11
  } else if (outcome == "heart failure") {
    column <- 17
  } else if (outcome == "pneumonia") {
    column <- 23
  } else {
    stop("invalid outcome")
  }
  
  data.raw[, column] <- as.numeric(data.raw[, column])
  data.state <- data.raw[data.raw$State == state,]
  data.state <- data.state[complete.cases(data.state[,column]),]
  data.best  <- data.state[data.state[, column] == min(data.state[, column]),]
  data.ordered  <- data.best[order(data.best$Hospital.Name),]
  data.ordered[1,]$Hospital.Name
}