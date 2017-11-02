## Fourth Plot of the final Exploratoy Data Analysis Project

## setting the directory 
setwd("~/Desktop/exdata-data-NEI_data")

## load datasets

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## load the required packages
library(dplyr)
library(ggplot2)

## detecting SCC
combustion <- SCC %>%
    filter(grepl("combustion", SCC.Level.One) | grepl("Coal", SCC.Level.Three))

## filtering
newdata <- NEI %>%
    filter(SCC %in% unique(combustion$SCC)) %>%
    group_by(year) %>%
    summarise(N = n(), total = sum(Emissions, na.rm = TRUE))

ggplot(newdata, aes(x = year, y = total)) + 
    geom_line() + geom_point()  + 
    labs(x = "Year", y = "Total Emissions",
         title = "United States PM2.5 Emissions", subtitle = "Emissions from Coal")

dev.copy(png,'plot4.png')
dev.off()
