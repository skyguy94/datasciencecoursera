dataFile = "subset.rda"
loaded = FALSE

if (!file.exists("household_power_consumption.txt")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

if (!file.exists(dataFile) || is.null(data)) {
  raw <- read.table('household_power_consumption.txt', header=TRUE, sep=";", colClasses=c("character","character", rep("numeric", 7)), na.strings="?")
  raw$Time <- strptime(paste(raw$Date, raw$Time), "%d/%m/%Y %H:%M:%S")
  raw$Date <- as.Date(raw$Date, "%d/%m/%Y")
  filter <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  data <- subset(raw, Date %in% filter)
  saveRDS(data, dataFile)
  loaded = TRUE
}

if (!loaded) {
  data <- readRDS(dataFile)
  loaded = TRUE
}
