
pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2','ggtext')

map_df <- read.csv("india_uk.csv")%>%
  pivot_longer(cols = 1:2, names_to = "type", values_to = "value")



# Assuming you have already loaded your data and defined the plot_sratio object...

plot_sratio <- ggplot(map_df, aes(x = Year, y = value, colour = type)) +
  geom_line(linewidth = 1) +
  scale_y_continuous(expand = c(0, 0), labels = comma) +
  scale_x_continuous(breaks = c(1980, 1990, 2000, 2010, 2020, 2024)) +
  scale_colour_manual(values = c("#b80000", "#2D74B5")) +
  reith_style() +
  all_reith_underneath() +
  #theme(panel.grid.major = element_blank()) +
  labs(
    subtitle = "All values in $bn",
    title = "GDP of <span style='color:#b80000;'>India</span> and the<span style='color:#2D74B5;'> UK</span> at the current prices"
  ) +
  theme(
    plot.title = element_markdown(margin = margin(b = 10)), # Add margin to the bottom of the title
    plot.subtitle = element_markdown(color = "#222222", margin = margin(b = 7)) # Set subtitle color and margin
  )

plot_sratio

plot_sratio_2 <- plot_sratio + theme(legend.position = "none") + theme(
  plot.subtitle = element_markdown(hjust = -0.0) # Center align subtitle
)

plot_sratio_2







finalise_plot(plot_name = plot_sratio_2,
              source = "Source: International Monetary Fund",
              #footnote = "Note: Based on modeled International Labour Organisation (ILO) estimates",
              save_filepath = "india_uk-nc.png",
              width_pixels = 690,
              height_pixels = 480)