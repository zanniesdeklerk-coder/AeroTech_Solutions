# AeroTech Flight Operations & Delay Analysis

An R script that processes the `nycflights13` dataset to clean flight logs, calculate average airspeeds, and pinpoint where departure delays happen most often.

## What This Script Does

The code is split into three main sections:

1. **Data Cleaning & Feature Creation (`aerotech_clean`)**
   * Drops rows missing `dep_time`, `arr_time`, or `air_time` so they don't break downstream math.
   * Calculates flight speed in miles per hour (`speed_mph = distance / (air_time / 60)`).
   * Filters the data down to long-haul routes over 400 miles.

2. **Carrier Reliability (`carrier_fault_analysis`)**
   * Groups the cleaned flights by `carrier` to find each airline's average delay, total flight count, and worst single delay.
   * Sorts the results and pulls the top 5 carriers with the highest average departure delays.

3. **Hourly Bottlenecks (`hourly_bottlenecks`)**
   * Groups flights by their scheduled departure `hour` to calculate the average delay for each hour of the day.
   * Ranks the hours from worst to best to highlight peak congestion windows.

## Setup & Requirements

You'll need R installed along with two packages: `tidyverse` and `nycflights13`. If you don't have them yet, run this once in your R console:

```r
install.packages("tidyverse")
install.packages("nycflights13")
```

## Running the Code

1. Download the `.R` file from this repository.
2. Open it in RStudio (or your preferred R editor).
3. Run the full script. All three summary tables will print directly to your console.

## Key Variables Used

* `carrier`: Two-letter airline code.
* `distance`: Flight distance in miles (filtered to `> 400`).
* `air_time`: Total time spent in the air, in minutes.
* `speed_mph`: Custom column showing average flight speed in mph.
* `dep_delay`: Departure delay in minutes (negative numbers mean the flight left early).
* `hour`: Scheduled departure hour (0 to 23).

## Future Improvements

* Join the `airlines` table from `nycflights13` to show full airline names instead of just two-letter codes.
* Build a few quick `ggplot2` charts to visualize the hourly delay spikes.
* Save the output tables as `.csv` files.

