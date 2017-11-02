## Third Plot of the final Exploratoy Data Analysis Project

## setting the directory 
setwd("~/Desktop/exdata-data-NEI_data")

## load datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## load the required packages
library(dplyr)
library(ggplot2)

Baltimore <- NEI %>%
    filter(fips == 24510) %>%
    group_by(year, type) %>%
    summarise(N = n(), total = sum(Emissions, na.rm = TRUE))

ggplot(Baltimore, aes(x = year, y = total)) + 
    geom_line() + geom_point() + 
    facet_wrap(~type) + 
    labs(x = "Year", y = "Total Emissions",
         title = "Baltimore City", subtitle = "PM2.5 emissions over time")

dev.copy(png,'plot3.png')
dev.off()
