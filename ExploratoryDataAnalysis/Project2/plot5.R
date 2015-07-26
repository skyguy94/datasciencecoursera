library(ggplot2)
source('loadData.R')

plotdata <- NEI[NEI$fips == '24510' & NEI$type == 'ON-ROAD',]
plotdata <- aggregate(Emissions ~ year, plotdata, sum)

png('Plot5.png', width=480, height=480, units='px')
p <- ggplot(plotdata, aes(factor(year), Emissions)) +
  geom_bar(stat='identity') +
  xlab('year') +
  ylab('Total PM2.5 Emissions') +
  ggtitle('Total Emissions from road vehicles in Baltimore City')

print(p)
dev.off()