
pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2','ggtext')

map_df <- read.csv("manu_export.csv")


plot_sratio <- ggplot(map_df, aes(x = Year, y = billion, fill= rule)) +
  geom_col() +
  scale_y_continuous(expand = c(0, 0), labels = function(x) paste0(x, "b")) +
  scale_fill_manual(values = c("#F97923", "#2D74B5")) +
  scale_x_continuous(breaks = c(2004, 2014, 2022))+
  facet_wrap(~type, nrow = 2)+
  reith_style() +
  all_reith_underneath() +
  guides(fill = guide_legend()) +
  theme(legend.position = "none") +
  labs(
    title = "India's manufacturing and export growth",
    subtitle = "")+
  theme(plot.subtitle = element_markdown())

plot_sratio

plot_sratio_2 <- plot_sratio + theme(legend.position = "none") + theme(
  plot.subtitle = element_markdown(hjust = 0.08) # Center align subtitle
)

finalise_plot(plot_name = plot_sratio_2,
              source = "Source: Ministry of Commerce and Industry, World Bank",
              #footnote = "Note: Based on modeled International Labour Organisation (ILO) estimates",
              save_filepath = "export_manu-nc.png",
              width_pixels = 690,
              height_pixels = 520)
