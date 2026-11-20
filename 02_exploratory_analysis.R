year_summary <- panel_data %>%
  group_by(year) %>%
  summarise(
    avg_literacy = mean(lit),
    avg_electricity = mean(ele),
    avg_urbanization = mean(urb),
    avg_tap_water = mean(tap)
  )

print(year_summary)


ggplot(year_summary, aes(x = year)) +
  geom_line(
    aes(y = avg_literacy, color = "Literacy"),
    linewidth = 1
  ) +
  geom_point(
    aes(y = avg_literacy, color = "Literacy"),
    size = 3
  ) +
  geom_line(
    aes(y = avg_electricity, color = "Electricity"),
    linewidth = 1
  ) +
  geom_point(
    aes(y = avg_electricity, color = "Electricity"),
    size = 3
  ) +
  labs(
    title = "Literacy and Electricity Trends (1981–2001)",
    x = "Census Year",
    y = "Average Percentage",
    color = "Indicator"
  ) +
  theme_minimal()

cor_matrix <- cor(
  panel_data %>%
    select(lit, ele, urb, tap),
  use = "complete.obs",
  method = "pearson"
)

print(cor_matrix)

corrplot(
  cor_matrix,
  method = "color",
  addCoef.col = "black",
  tl.col = "black",
  number.cex = 0.8
)
