jail_wa <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")

library("tidyverse")
library("dplyr")

county_largest_white_pop <- jail_wa %>%
  filter(white_jail_pop_rate == max(white_jail_pop_rate, na.rm = TRUE))

county_largest_black_pop <- jail_wa %>%
  filter(black_jail_pop_rate == max(black_jail_pop_rate, na.rm = TRUE))

jail_highest_pop <- jail_wa %>%
  filter(total_pop == max(total_pop, na.rm = TRUE))

black_kc <- jail_highest_pop %>% select(black_jail_pop_rate)

white_kc <- jail_highest_pop %>% select(white_jail_pop_rate)

