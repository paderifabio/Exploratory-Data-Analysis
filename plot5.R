## Fifth Plot of the final Exploratoy Data Analysis Project

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
    filter(SCC %in% unique(vehicle$SCC) & fips == 24510) %>%
    group_by(year) %>%
    summarise(N = n(), total = sum(Emissions, na.rm = TRUE))

ggplot(newdata, aes(x = year, y = total)) + 
    geom_line() + geom_point()  + 
    labs(x = "Year", y = "Total Emissions",
         title = "Baltimore City PM2.5 Emissions", subtitle = "Emissions from mothor vehicle")

dev.copy(png,'plot5.png')
dev.off()
