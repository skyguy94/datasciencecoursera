rankall <- function(outcome, num = "best") {
  data.raw <- read.csv("outcome-of-care-measures.csv", na.string="Not Available", stringsAsFactors=FALSE)
  
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
  states <- sort(unique(data.raw$State))
  data.aggregate = data.frame("hospital" = character(), "state" = character(), stringsAsFactors=FALSE)
  for (index in 1:length(states)) {
    data.aggregate[nrow(data.aggregate) + 1, "state"] <- states[index]
    data.state <- data.raw[data.raw$State == states[index],]
    data.best <- data.state[with(data.state, order(data.state[,column], data.state[, 2])),]    
    if (num == "best") {
      data.aggregate[nrow(data.aggregate), "hospital"] <- head(data.best, 1)$Hospital.Name
    } else if (num == "worst") {
      data.aggregate[nrow(data.aggregate), "hospital"] <- tail(data.best, 1)$Hospital.Name
    } else if (num <= nrow(data.best)) {
      data.aggregate[nrow(data.aggregate), "hospital"] <- data.best[num, "Hospital.Name"]
    } else {
      data.aggregate[nrow(data.aggregate), "hospital"] <- NA
    }
  }
  data.aggregate
}