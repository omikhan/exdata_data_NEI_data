#Subset of PM2.5 emissions from Motor Vehicles in baltimore
NEI.Motor <- NEI[which(NEI$type == "ON-ROAD" &NEI$fips == "24510") , ]

#Sum the Vehicle Emissions by Year 
Sum.Vehicle.Emissions.Year <- ddply(NEI.Motor, .(year), function(x) sum(x$Emissions))

#plot the graph..
png("plot5.png")

qplot(year, V1, data=Sum.Vehicle.Emissions.Year,  geom = "line")+
  ggtitle( "Trend of Motor Vehicle Sources in Baltimore")+ xlab("Year") +
  ylab(expression("Total" ~ PM2.5 ~ "Emissions"))


dev.off()