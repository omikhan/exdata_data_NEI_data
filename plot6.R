#Subset of PM2.5 emissions from Motor Vehicles in baltimore
NEI.Motor.Balti <- NEI[which(NEI$type == "ON-ROAD" &NEI$fips == "24510") , ]

#Subset of PM2.5 emissions from Motor Vehicles in California
NEI.Motor.Cali <- NEI[which(NEI$type == "ON-ROAD" &NEI$fips == "06037") , ]


#Sum the Vehicle Emissions by Year for Baltimore
Sum.Balti.Vehicle.Emissions.Year <- ddply(NEI.Motor.Balti, .(year), function(x) sum(x$Emissions))
library(reshape2)

#Sum the Vehicle Emissions by Year for Baltimore
Sum.Cali.Vehicle.Emissions.Year <- ddply(NEI.Motor.Cali, .(year), function(x) sum(x$Emissions))

Emission.all <- cbind (Sum.Balti.Vehicle.Emissions.Year,Sum.Cali.Vehicle.Emissions.Year[,2] )

colnames(Emission.all)[2] <- "Balti.Emissions"
colnames(Emission.all)[3] <- "Cali.Emissions"

#reshape the data for stacked bar graph..
dat.m <- melt(Emission.all,id.vars = "year")

#plot the graph..
png("plot6.png")

ggplot(dat.m, aes(x = year, y = value,fill=variable)) +
  geom_bar(stat='identity')+
  ggtitle( "Trend of Motor Vehicle Sources in Baltimore and California")+ 
  xlab("Year") +
  ylab(expression("Total" ~ PM2.5 ~ "Emissions"))

dev.off()