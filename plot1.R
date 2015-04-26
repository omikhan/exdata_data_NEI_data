png("plot1.png")
barplot(tapply(NEI$Emissions, NEI$year,sum), main = "Annual US PM2.5 Emission Trend from 1999 to 2008", xlab = "Year",  ylab=expression("Total" ~ PM2.5 ~ "Emissions") , col = "red")
dev.off()



