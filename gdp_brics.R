pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2','ggtext')

map_df <- read.csv("gdp.csv")%>%
  arrange(desc(GDP))
map_df



# Assuming you have already loaded your data and defined the plot_sratio object...

# Custom labeling function to determine label color based on bar height
label_color <- function(y) {
  ifelse(y >= max(map_df$GDP) * 0.8, "white", "black")  # Adjust threshold as needed
}

plot_sratio <- ggplot(map_df, aes(x = reorder(Country, GDP), y = GDP)) +
  geom_col(fill = "#661808") +
  coord_flip() +
  scale_y_continuous(expand = c(0, 0), labels = comma) +
  geom_text(aes(label = comma(GDP), color = GDP),  # Label with commas and color determined by height
            position = position_dodge(width = 0.9),  # Dodge the labels slightly
            hjust = ifelse(map_df$GDP >= max(map_df$GDP) * 0.8, 1.2, -0.2),  # Adjust label position based on bar height
            color = label_color(map_df$GDP)) +  # Set label color
  reith_style() +
  all_reith_underneath() +
  labs(title = "GDP per capita of BRICS and selected countries", subtitle = "Values at current US$") +
  theme(
    plot.subtitle = element_text(margin = margin(b = 20)),
    plot.title = element_text(margin = margin(b = 10))
  )+
  theme(panel.grid.major = element_blank())

plot_sratio


finalise_plot(plot_name = plot_sratio,
              source = "Source: World Bank",
              #footnote = " Financial year 2021-22's expenditures are provisional actuals.\n FY2022-23's expenditures are budget estimates",
              save_filepath = "gdp-nc.png",
              width_pixels = 690,height_pixels = 480)