zipFile <- "data.zip"
if (!file.exists(zipFile)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", zipFile)
}

if (!file.exists("summarySCC_PM25.rds") || !file.exists("Source_Classification_Code.rds")) { 
  unzip(filename)
}

## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}
