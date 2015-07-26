library(ggplot2)
source('loadData.R')

plotdata <- NEI[NEI$fips == '24510',]
plotdata <- aggregate(Emissions ~ year + type, plotdata, sum)

png('Plot3.png', width=480, height=480, units='px')
plot <- ggplot(plotdata, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1, method='loess') +
  ggtitle('Total Emissions by Type in Baltimore City')
print(plot)
dev.off()