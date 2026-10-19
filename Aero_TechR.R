# Install the required packages (only need to run this once)
install.packages("tidyverse")
install.packages("nycflights13")

# Load the libraries into your active R session
library(tidyverse)
library(nycflights13)
# Make sure packages are loaded
library(tidyverse)
library(nycflights13)

# ==============================================================================
# PROBLEM 1: Data Engineering, Cleaning, and Feature Creation
# ==============================================================================

aerotech_clean <- flights %>%
  # Drop missing values across vital time columns to prevent downstream calculation errors
  filter(!is.na(dep_time), !is.na(arr_time), !is.na(air_time)) %>%
  # Feature Engineering: air_time is in minutes, divide by 60 to get hours for mph
  mutate(speed_mph = distance / (air_time / 60)) %>%
  # Filter for long-distance logistical routes
  filter(distance > 400)

print("--- Problem 1: Cleaned Dataset Preview ---")
print(head(aerotech_clean %>% select(carrier, flight, distance, air_time, speed_mph)))


# ==============================================================================
# PROBLEM 2: Quality Engineering - Carrier Reliability Analysis
# ==============================================================================

carrier_fault_analysis <- aerotech_clean %>%
  group_by(carrier) %>%
  summarise(
    avg_delay     = mean(dep_delay),
    total_flights = n(),
    max_delay     = max(dep_delay)
  ) %>%
  # Sort to put the highest average delays at the very top
  arrange(desc(avg_delay)) %>%
  # Extract only the top 5 worst performers
  slice_head(n = 5)

print("--- Problem 2: Worst 5 Carriers for Reliability ---")
print(carrier_fault_analysis)


# ==============================================================================
# PROBLEM 3: Process Optimization - Hourly Operational Bottlenecks
# ==============================================================================

hourly_bottlenecks <- aerotech_clean %>%
  group_by(hour) %>%
  summarise(
    avg_hourly_delay = mean(dep_delay)
  ) %>%
  # Sort from worst hour to best hour
  arrange(desc(avg_hourly_delay))

print("--- Problem 3: Hourly Delays Sorted Worst to Best ---")
print(hourly_bottlenecks)

