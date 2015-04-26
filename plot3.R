library(plyr)
library(ggplot2)



sum.balti.PM25.By.Year.type <- ddply(NEI.Balti, .(year, type), function(x) sum(x$Emissions))


png("plot3.png")
qplot(year, V1, data=sum.balti.PM25.By.Year.type, color=type, geom="line") +
  ggtitle(expression("Baltimore " ~ PM2.5 ~ "Emissions by Year and Source")) +
  xlab("Year") +
  ylab(expression("Total" ~ PM2.5 ~ "Emissions"))
dev.off()