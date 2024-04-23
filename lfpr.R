
pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2','ggtext')

map_df <- read.csv("lfpr.csv")

library(ggplot2)
library(ggtext)

# Assuming you have already loaded your data and defined the plot_sratio object...

plot_sratio <- ggplot(map_df, aes(x = Year, y = value, colour = type)) +
  geom_line(linewidth = 1) +
  scale_y_continuous(expand = c(0, 0), labels = function(x) paste0(x, "%"), limits = c(0, 100)) +
  scale_colour_manual(values = c("#690A70", "#F97923")) +
  reith_style() +
  all_reith_underneath() +
  theme(panel.grid.major = element_blank()) +
  labs(
    title = "India's labor force participation rate",
    subtitle = "Percentage of <span style='color:#F97923;'>**male**</span> and <span style='color:#690A70;'>**female**</span> population\nages 15+"
  ) +
  theme(
    plot.subtitle = element_markdown(margin = margin(b = 10)), # Add margin to the bottom of the subtitle
    plot.title = element_text(margin = margin(b = 7)) # Add margin to the bottom of the title
  )

plot_sratio

plot_sratio_2 <- plot_sratio + theme(legend.position = "none") + theme(
  plot.subtitle = element_markdown(hjust = -0.01) # Center align subtitle
)

plot_sratio_2

                                   
                              




finalise_plot(plot_name = plot_sratio_2,
              source = "Source: World Bank",
              footnote = "Note: Based on modeled International Labour Organisation (ILO) estimates",
              save_filepath = "lfpr-nc.png",
              width_pixels = 690,
              height_pixels = 480)