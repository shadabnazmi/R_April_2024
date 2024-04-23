
pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2','reshape2')

map_df <- read.csv("digital_payment.csv")

plot_sratio <- ggplot(map_df, aes(x = Year, y = volume, group = 1)) +
  geom_line(linewidth =1, colour = "#b80000" )+
  #geom_point(aes(x = Year, y = volume, colour = "#b80000" ))+
  scale_y_continuous(expand = c(0,0), limits = c(0, 150))+
  scale_x_discrete(breaks = c("2014-15", "2018-19", "2023-24*"))+
  #scale_colour_manual(values = c("#11708C","#FFB42C"))+
  #facet_wrap(~ type, ncol = 2, scales = "free")+
  #scale_x_discrete(breaks = function(x){x[c(TRUE, FALSE)]})+
  reith_style()+
  all_reith_underneath()+
  labs(title = "India topping global digital payments growth", subtitle = "Volume of transactions in billions")
plot_sratio

plot_sratio_1 <- plot_sratio+theme(legend.position = "none")+theme(
  plot.subtitle = element_text(margin = margin(b = 20)))+theme(
    plot.title = element_text(margin = margin(b = 10)))
plot_sratio_1


finalise_plot(plot_name = plot_sratio_1,
              source = "Source: Press Information Bureau, Parliament of India",
              save_filepath = "digital_payment-nc.png",
              footnote = "Note: Financial year 2023-24's data is till 11 Dec, 2023",
              width_pixels = 690,
              height_pixels = 480)