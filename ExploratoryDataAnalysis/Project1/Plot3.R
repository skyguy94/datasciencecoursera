setwd('D:/Projects/datasciencecoursera/ExploratoryDataAnalysis/Project1')
source('LoadData.R')

png('Plot3.png', width=480, height=480, units="px")
plot(data$Time, data$Sub_metering_1, legend="Sub_metering_1", type="l", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), lty=rep("solid", 3))
dev.off()
