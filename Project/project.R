library(tidyverse)
library(dataRetrieval)
library(lubridate)

wq <- readWQPqw(siteNumbers = "USGS-09361500", parameterCd = "", startDate = "", endDate = "")


ggplot(filter(wq, CharacteristicName == "Temperature, water"), aes(x = ActivityStartDate, y = ResultMeasureValue)) +
  geom_point()

discharge <- readNWISdv(siteNumbers = "06730200", parameterCd = "00060", startDate = "", endDate = "") %>%
  filter(year(Date) > 1986)
ggplot(discharge, aes(x = Date, y = X_00060_00003)) +
  geom_line() + 
  labs(x = "Year", y = "Discharge (cfs)")

snotel <- read.csv("./Project/snotel_data.csv") %>%
  rename("")

snotel$Date <- mdy(snotel$Date)

ggplot(snotel, aes(x = Date, y = SWE..in.)) +
  geom_line()
