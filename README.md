# AeroTech Logistics & Flight Operations Analysis

An end-to-end R data engineering and operational analysis pipeline built using the `nycflights13` dataset. This project cleans raw flight logs, engineers flight-speed metrics, identifies underperforming carriers, and isolates hourly departure bottlenecks.

---

## 📋 Project Overview

This script simulates a real-world data engineering and process optimization workflow for **AeroTech**, focusing on three core areas:

1. **Data Engineering & Feature Creation (`aerotech_clean`):** Filters out incomplete flight records, calculates average flight speed in miles per hour (`speed_mph`), and isolates long-haul routes (`distance > 400` miles).
2. **Quality Engineering (`carrier_fault_analysis`):** Evaluates airline reliability by calculating average departure delays, total flight volume, and maximum delay spikes to rank the top 5 worst-performing carriers.
3. **Process Optimization (`hourly_bottlenecks`):** Aggregates departure delays by scheduled departure hour to pinpoint peak congestion windows and operational bottlenecks.

---

## 🛠️ Prerequisites & Setup

To run this analysis, you need **R** (version 4.0 or higher recommended) and the following CRAN packages:

* `tidyverse` (for data manipulation via `dplyr`)
* `nycflights13` (for the underlying `flights` dataset)

### Installation

Run the following commands in your R console to install the required packages (only needed once):

```r
install.packages("tidyverse")
install.packages("nycflights13")
```

---

## 🚀 How to Run the Script

1. Clone this repository or download the `.R` script file to your local machine.
2. Open the script in **RStudio** or your preferred R environment.
3. Run the entire script (`Ctrl + Alt + R` on Windows/Linux or `Cmd + Option + R` on macOS).

---

## 📊 Script Breakdown & Outputs

### 1. Data Cleaning & Feature Engineering
* **Logic:** Removes rows with `NA` values in `dep_time`, `arr_time`, and `air_time`, creates `speed_mph = distance / (air_time / 60)`, and filters for routes longer than 400 miles.
* **Console Output:** Prints a preview of the cleaned dataset showing `carrier`, `flight`, `distance`, `air_time`, and the newly engineered `speed_mph` column.

### 2. Carrier Reliability Analysis
* **Logic:** Groups cleaned data by `carrier`, computes `avg_delay`, `total_flights`, and `max_delay`, and extracts the 5 airlines with the highest average departure delays.
* **Console Output:** Displays a ranked summary table of the 5 least reliable carriers.

### 3. Hourly Operational Bottlenecks
* **Logic:** Groups flights by scheduled departure `hour` and ranks them in descending order based on `avg_hourly_delay`.
* **Console Output:** Displays a chronological breakdown sorted from the highest-delay hours to the smoothest operating hours.

---

## 📁 Data Dictionary (Key Engineered & Used Variables)

| Variable | Type | Description |
| :--- | :--- | :--- |
| `carrier` | Character | Two-letter airline carrier abbreviation. |
| `distance` | Numeric | Distance between airports, in miles (filtered to `> 400`). |
| `air_time` | Numeric | Amount of time spent in the air, in minutes. |
| `speed_mph` | Numeric | **Engineered:** Average flight speed calculated in miles per hour. |
| `dep_delay` | Numeric | Departure delay, in minutes (negative values indicate early departures). |
| `hour` | Numeric | Scheduled hour of departure (0–23). |

---

## 💡 Potential Next Steps
* Add `ggplot2` visualizations to plot hourly delay trends and carrier comparisons.
* Export the resulting summary tables (`carrier_fault_analysis` and `hourly_bottlenecks`) to `.csv` files for stakeholder reporting.
* Join the `airlines` table from `nycflights13` to display full airline names alongside carrier codes.
