#Chart 1
library(dplyr)
library(ggplot2)
library(readr)

jail_wa <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")


chartOne_counties_data <- jail_wa %>%
  filter(county_name %in% c("King County", "Yakima County", "Pend Oreille County", "Adams County", "Chelan County", "Clark County"))

ggplot(chartOne_counties_data, aes(x = year, y = total_pop, color = county_name)) +
  geom_line() +
  labs(title = "Total Inmates in Selected Counties Over the Years",
       x = "Year",
       y = "Total Inmates") +
  theme_minimal()