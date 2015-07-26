library(ggplot2)
source('loadData.R')

plotdata <- NEI[(NEI$fips == '24510' | NEI$fips == '06037') & NEI$type=='ON-ROAD',]
plotdata <- aggregate(Emissions ~ year + fips, plotdata, sum)

plotdata$fips[plotdata$fips == '24510'] <- 'Baltimore, MD'
plotdata$fips[plotdata$fips == '06037'] <- 'Los Angeles, CA'

png('Plot6.png', width=480, height=480, units='px')
p <- ggplot(plotdata, aes(factor(year), Emissions)) + 
  facet_grid(. ~ fips) +
  geom_bar(stat='identity') + 
  xlab('year') +
  ylab('Total PM2.5 emissions') + 
  ggtitle('Motor Vehicle PM2.5 Emissions in Baltimore & Los Angeles')
print(p)
dev.off()
