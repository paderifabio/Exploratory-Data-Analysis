## Second Plot of the final Exploratoy Data Analysis Project

## setting the directory 
setwd("~/Desktop/exdata-data-NEI_data")

## load datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## load the required package
library(dplyr)

Baltimore <- NEI %>%
    filter(fips == 24510) %>%
    group_by(year) %>%
    summarise(N = n(), total = sum(Emissions, na.rm = TRUE)) 

with(Baltimore, plot(year, total, pch = 20, 
                 ylab = "Total of emissions", 
                 main = "Baltimore City PM2.5 emissions over time"))
lines(Baltimore$year, Baltimore$total, lty = 2)

dev.copy(png,'plot2.png')
dev.off()
