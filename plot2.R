NEI.Balti <- NEI[which(NEI$fips == "24510"), ]

png("plot2.png")
barplot(tapply(NEI.Balti$Emissions, NEI.Balti$year,sum), main = "Annual Baltimore PM2.5 Emission Trend from 1999 to 2008", xlab = "Year",  ylab=expression("Total" ~ PM2.5 ~ "Emissions")  , col = "red")
dev.off()