setwd('D:/Projects/datasciencecoursera/ExploratoryDataAnalysis/Project1')
source('LoadData.R')

png('Plot2.png', width=480, height=480, units="px")
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
