pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2','ggtext')

map_df <- read.csv("capital_expenditure.csv")

plot_sratio <- ggplot(map_df, aes(x = Year, y = expenditure))+
  geom_col(fill = "#754DF1")+
  scale_y_continuous(expand = c(0, 0),labels = function(x) paste0(x, "%"))+
  scale_x_discrete(breaks = c("2018-19", "2020-21", "2022-23*"))+
  reith_style() +
  all_reith_underneath() +
  labs(title = "Expenditure of central government as\npercentage of GDP")+theme(
    plot.subtitle = element_text(margin = margin(b = 20)))+theme(
      plot.title = element_text(margin = margin(b = 10)))
plot_sratio

finalise_plot(plot_name = plot_sratio,
              source = "Source: India's Economic Survey",
              footnote = " Financial year 2021-22's expenditures are provisional actuals.\n FY2022-23's expenditures are budget estimates",
              save_filepath = "expend-nc.png",
              width_pixels = 690,height_pixels = 480)