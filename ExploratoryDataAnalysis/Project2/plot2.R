source('loadData.R')

plotdata <- NEI[NEI$fips == '24510',]
plotdata <- aggregate(Emissions ~ year, plotdata, sum)

png('Plot2.png', width=480, height=480, units='px')
barplot(
  plotdata$Emissions,
  names.arg=plotdata$year,
  xlab='Year',
  ylab='PM2.5 Emissions',
  main='Total PM2.5 Emissions from Baltimore City'
)
dev.off()