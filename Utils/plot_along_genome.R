pos2cumulative_pos <- function(chromosome, position, chr_lengths){
  chr_lengths_cumulative <- chr_lengths %>% 
    mutate(total=cumsum(length)-length) %>%
    dplyr::select(-length)
  tibble(chr = chromosome,
         pos = position) %>% 
    left_join(chr_lengths_cumulative) %>% 
    mutate(cumulative_pos = pos + total) %>% 
    pull(cumulative_pos)
}

plot_along_genome_scaffold <- function(data, chr_lengths){
  axisdf <- chr_lengths %>% 
    mutate(total = cumsum(length) - length) %>%
    mutate(center = total + length/2)
  data %>% 
    ggplot(aes(x = cumulative_pos)) +
      scale_color_manual(values = rep(c("grey", "skyblue"), nrow(chr_lengths))) +
      scale_x_continuous(label = axisdf$chr, breaks= axisdf$center) +
      theme_bw() +
      theme(legend.position="none",
            panel.border = element_blank(),
            panel.grid.major.x = element_blank(),
            panel.grid.minor.x = element_blank())
}