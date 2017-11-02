## Sixth Plot of the final Exploratoy Data Analysis Project

## setting the directory 
setwd("~/Desktop/exdata-data-NEI_data")

## load datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## load the required packages
library(dplyr)
library(ggplot2)


## detecting SCC
vehicle <- SCC %>%
    filter(grepl("Vehicle", Short.Name))

## filtering
newdata <- NEI %>%
    filter(SCC %in% unique(vehicle$SCC) & fips %in% c("24510", "06037")) %>%
    group_by(year, fips) %>%
    summarise(N = n(), total = sum(Emissions, na.rm = TRUE)) %>%
    rename(Area = fips)
    arrange(Area)

newdata$Area <- factor(newdata$Area, levels = c("06037","24510"), 
       labels = c("Los Angeles County", "Baltimore City"))

ggplot(newdata, aes(x = year, y = total, col = Area)) + 
    geom_line() + geom_point()  + 
    labs(x = "Year", y = "PM2.5 Emissions in tons",
         subtitle = "Emissions from mothor vehicle over time in Los Angeles County and Baltimore City")
    
## saving the current plot
dev.copy(png,'plot6.png')
dev.off()
