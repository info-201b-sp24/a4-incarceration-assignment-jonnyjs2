library(ggplot2)
library(maps)
library(mapdata)
library(dplyr)
library(readr)
library(viridis)


jail_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv")

total_jail <- jail_data %>%
  group_by(county_name) %>%
  summarise(total_jail_pop = sum(total_pop, na.rm = TRUE))


wa_county_map <- map_data("county", region = "washington")

total_jail$county_name <- tolower(total_jail$county_name)
total_jail$county_name <- gsub(" county", "", total_jail$county_name)


map_data <- left_join(wa_county_map, total_jail, by = c("subregion" = "county_name"))


ggplot(data = map_data, aes(x = long, y = lat, group = group, fill = total_jail_pop)) +
  geom_polygon(color = "black") +
  coord_fixed(1.3) +
  theme_minimal() +
  labs(title = "Total Jail Population Across Washington State Counties",
       x = "Longitude",
       y = "Latitude",
       fill = "Total Jail Population") +
  scale_fill_viridis_c(name = "Total Jail Population", labels = scales::comma)