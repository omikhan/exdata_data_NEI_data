#search distinct strings of column SCC.Level.Three that have Coal in them
grep.scc<-unique(grep("coal", SCC$SCC.Level.Three, ignore.case=TRUE, value=TRUE))  


#Subset SCC by getting only coal combustion related records
SCC.Coal<-subset(SCC, SCC.Level.Three %in% grep.scc)    
#Subset NEI by 
NEI.Coal<-subset(NEI, SCC %in% SCC.Coal$SCC)  

#get total emission from Coal Combustion sources by year and source
CoalEmissionSumByYearNSrc <- ddply(NEI.Coal, .(year, type), function(x) sum(x$Emissions))

png("plot4.png")

qplot(year, V1, data=CoalEmissionSumByYearNSrc, facets = .~type, geom = "line")+
      ggtitle( "Trend of Coal Combustion Sources")+ xlab("Year") +
  ylab(expression("Total" ~ PM2.5 ~ "Emissions"))
      

dev.off()





