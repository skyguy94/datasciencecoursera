source('loadData.R')

plotdata <- aggregate(Emissions ~ year, NEI, sum)

png('Plot1.png', width=480, height=480, units='px')
barplot(plotdata$Emissions, names.arg=plotdata$year, xlab='Year', ylab='PM2.5 Emissions', main='Total PM2.5 Emissionas From All US Sources')
dev.off()