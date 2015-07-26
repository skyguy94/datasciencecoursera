library(ggplot2)
source('loadData.R')

data <- merge(NEI, SCC, by='SCC')
coal <- grepl('coal', data$Short.Name, ignore.case=TRUE)
plotdata <- data[coal,]
plotdata <- aggregate(Emissions ~ year, plotdata, sum)

png('Plot4.png', width=480, height=480, units='px')
p <- ggplot(plotdata, aes(x=year, y=Emissions)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1, method='loess') +
  ggtitle('Total PM2.5 Coal Emissions in the US')
print(p)
dev.off()