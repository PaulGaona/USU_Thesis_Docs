# Load necessary packages
library("ggplot2")
library("dplyr")
library("IntRF")
library("ggpubr")
library("scales")
library("gridExtra")
source("./Analysis/Simulation/Settings.R")
set.seed(1)
# Setting 4 data simulating
df_set4 <- set4(
  n = 500,
  Xc_a = 12, Xc_b = 4,
  ec_a = 0, ec_b = 4/2,
  Xr_a = .5, Xr_b = 2,
  er_a = 0, er_b = .5/4
)
# Plot Y vs X
set4_p <- IntRF::int_plot(
  # Select relevant columns from prices dataframe
  int_data = df_set4 %>%
    select(Yc, Yr, Xc, Xr),
  title = "Setting 4",
  xlabel = "[X]",
  ylabel = "[Y]"
)+
  ggplot2::scale_x_continuous(
    limits = c(
      min(df_set4$Xc - df_set4$Xr)-1, # Set lower limit of x-axis
      max(df_set4$Xc + df_set4$Xr)+1
    ), # Set upper limit of x-axis
    n.breaks = 9, # Set number of x-axis breaks to 10
    labels = scales::label_wrap(6) # Wrap x-axis labels to fit within 6 lines
  ) +
  ggplot2::scale_y_continuous(
    limits = c(
      min(df_set4$Yc - df_set4$Yr)-1, # Set lower limit of y-axis
      max(df_set4$Yc + df_set4$Yr)+1 # Set upper limit of y-axis
    ),
    n.breaks = 8 # Set number of y-axis breaks to 8
  ) +
  theme(
    axis.title.x = element_text(size = 16),
    axis.text.x = element_text(size = 14),
    axis.title.y = element_text(size = 16),
    axis.text.y = element_text(size = 14)
  )

# Setting 5 data simulating
set.seed(1)

df_set5 <- set5(
  n = 250,
  Xc_a = 3, Xc_b = 2,
  ec_a = 0, ec_b = 1.5,
  Xr_a = 0.5, Xr_b = 1,
  er_a = 0, er_b = .5/4
)
# Plot Y vs X
set5_p <- IntRF::int_plot(
  # Select relevant columns from prices dataframe
  int_data = df_set5 %>%
    select(Yc, Yr, Xc, Xr),
  title = "Setting 5",
  xlabel = "[X]",
  ylabel = "[Y]"
)+
  ggplot2::scale_x_continuous(
    limits = c(
      min(df_set5$Xc - df_set5$Xr), # Set lower limit of x-axis
      max(df_set5$Xc + df_set5$Xr)
    ), # Set upper limit of x-axis
    n.breaks = 10, # Set number of x-axis breaks to 10
    labels = scales::label_wrap(6) # Wrap x-axis labels to fit within 6 lines
  ) +
  ggplot2::scale_y_continuous(
    limits = c(
      min(df_set5$Yc - df_set5$Yr), # Set lower limit of y-axis
      max(df_set5$Yc + df_set5$Yr) # Set upper limit of y-axis
    ),
    n.breaks = 8 # Set number of y-axis breaks to 8
  ) +
  theme(
    axis.title.x = element_text(size = 16),
    axis.text.x = element_text(size = 14),
    axis.title.y = element_text(size = 16),
    axis.text.y = element_text(size = 14)
  )

# Setting 6 data simulating


df_set6 <- set6(
  n = 500,
  Xc_a = 8, Xc_b = 2,
  ec_a = 0, ec_b = 1,
  Xr_a = 0, Xr_b = 1,
  er_a = 0, er_b = 0.25
)
# Plot Y vs X
set6_p <- IntRF::int_plot(
  # Select relevant columns from prices dataframe
  int_data = df_set6 %>%
    select(Yc, Yr, Xc, Xr),
  title = "Setting 6",
  xlabel = "[X]",
  ylabel = "[Y]"
)+
  ggplot2::scale_x_continuous(
    limits = c(
      min(df_set6$Xc - df_set6$Xr), # Set lower limit of x-axis
      max(df_set6$Xc + df_set6$Xr)
    ), # Set upper limit of x-axis
    n.breaks = 10, # Set number of x-axis breaks to 10
    labels = scales::label_wrap(6) # Wrap x-axis labels to fit within 6 lines
  ) +
  ggplot2::scale_y_continuous(
    limits = c(
      min(df_set6$Yc - df_set6$Yr), # Set lower limit of y-axis
      max(df_set6$Yc + df_set6$Yr) # Set upper limit of y-axis
    ),
    n.breaks = 8 # Set number of y-axis breaks to 8
  ) +
  theme(
    axis.title.x = element_text(size = 16),
    axis.text.x = element_text(size = 14),
    axis.title.y = element_text(size = 16),
    axis.text.y = element_text(size = 14)
  )

# export figures

# setting 4
pdf(file = "./Analysis/Simulation/figs/set4_fig.pdf")
set4_p +
  theme(aspect.ratio=.8)
dev.off()

# setting 5
pdf(file = "./Analysis/Simulation/figs/set5_fig.pdf")
set5_p +
  theme(aspect.ratio=.8)
dev.off()

# setting 6
pdf(file = "./Analysis/Simulation/figs/set6_fig.pdf")
set6_p +
  theme(aspect.ratio=.8)
dev.off()

# settings 4, 5, and 6
pdf(file = "./Analysis/Simulation/figs/set456_fig.pdf")
gridExtra::grid.arrange(set4_p, set5_p, set6_p,
                        ncol = 1,
                        widths = unit(10, c("cm")),
                        heights = c(
                          unit(10, c("cm")),
                          unit(10, c("cm")),
                          unit(10, c("cm"))
                        )
)
dev.off()

