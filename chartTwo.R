#Chart 2
library(dplyr)
library(ggplot2)
library(readr)

jail_wa <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")


chartTwo_counties_data <- jail_wa %>%
  filter(county_name %in% c("King County", "Yakima County", "Pend Oreille County"))

ggplot(chartTwo_counties_data, aes(x = total_pop, y = black_jail_pop_rate, color = county_name)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Relationship Between Total Inmates and Black Inmates in Selected Counties",
       x = "Total Inmates",
       y = "Black Inmates") +
  theme_minimal()