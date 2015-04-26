#load the data 
NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")
 
 ##############################
 #answering question 1...
 ###################
 
#Emissions over the years..
 #
 #can add regression line through the plot...
 barplot(tapply(NEI$Emissions, NEI$year,sum), main = "Total Emission from 1999 to 2008", xlab = "Year", ylab = ylab=expression("Total" ~ PM2.5 ~ "Emissions") , col = "red")

##
 
#Emissions trend over the years for Mariland

 barplot(tapply(subset(NEI,fips == "24510")$Emissions, subset(NEI,fips == "24510")$year,sum), main = "Total Emission for Baltimore City from 1999 to 2008", xlab = "Years", ylab = "Emissions", col = "red")

#
library(ggplot2)
NEI <- transform(NEI, type = factor(type))
NEI.baltimore <- subset(NEI,fips == "24510")
qplot(NEI.baltimore$year, sum(NEI.baltimore$Emissions),data = NEI.baltimore, facets = .~type, geom = c("point", "smooth"), method = "lm")

qplot(NEI.baltimore$year, NEI.baltimore$Emissions,data = NEI.baltimore, facets = .~type, geom = c("point", "smooth"), method = "lm")



aggdata <-aggregate(NEI.baltimore$Emissions, by=list(NEI.baltimore$type,NEI.baltimore$year),data = ,  FUN=sum, na.rm=TRUE)
