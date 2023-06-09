# Load necessary packages
library("ggplot2")
library("dplyr")
library("IntRF")
library("ggpubr")
library("scales")
library("gridExtra")
source("./Analysis/Simulation/Settings.R")
set.seed(1)
# Setting 1 data simulating
df_set1 <- set1(
  n = 500,
  Xc_a = 12, Xc_b = 3,
  ec_a = 0, ec_b = 3 / 4,
  Xr_a = 1, Xr_b = 3,
  er_a = 0, er_b = 1 / 20
)
# Plot Y vs X
set1_p <- IntRF::int_plot(
  # Select relevant columns from prices dataframe
  int_data = df_set1 %>%
    dplyr::select(Yc, Yr, Xc, Xr),
  title = "Setting 1",
  xlabel = "[X]",
  ylabel = "[Y]"
) +
  ggplot2::scale_x_continuous(
    limits = c(
      # Set lower limit of x-axis
      min(df_set1$Xc - df_set1$Xr) - 1,
      # Set upper limit of x-axis
      max(df_set1$Xc + df_set1$Xr) + 1
    ),
    # Set number of x-axis breaks to 8
    n.breaks = 8,
    # Wrap x-axis labels to fit within 6 lines
    labels = scales::label_wrap(6)
  ) +
  ggplot2::scale_y_continuous(
    limits = c(
      # Set lower limit of y-axis
      min(df_set1$Yc - df_set1$Yr) - 1,
      # Set upper limit of y-axis
      max(df_set1$Yc + df_set1$Yr) + 1
    ),
    # Set number of y-axis breaks to 8
    n.breaks = 8
  ) +
  # Set title and text size of x and y axis
  theme(
    axis.title.x = element_text(size = 16),
    axis.text.x = element_text(size = 14),
    axis.title.y = element_text(size = 16),
    axis.text.y = element_text(size = 14)
  )

# Setting 2 data simulating
set.seed(1)

df_set2 <- set2(
  n = 500,
  Xc_a = -5, Xc_b = 10,
  ec_a = 0, ec_b = 10 / 4,
  Xr_a = 1, Xr_b = 2,
  er_a = 0, er_b = 1 / 10
)
# Plot Y vs X
set2_p <- IntRF::int_plot(
  # Select relevant columns from prices dataframe
  int_data = df_set2 %>%
    select(Yc, Yr, Xc, Xr),
  title = "Setting 2",
  xlabel = "[X]",
  ylabel = "[Y]"
) +
  ggplot2::scale_x_continuous(
    limits = c(
      # Set lower limit of x-axis
      min(df_set2$Xc - df_set2$Xr) - 1,
      # Set upper limit of x-axis
      max(df_set2$Xc + df_set2$Xr) + 1
    ),
    # Set number of x-axis breaks to 10
    n.breaks = 10,
    # Wrap x-axis labels to fit within 6 lines
    labels = scales::label_wrap(6)
  ) +
  ggplot2::scale_y_continuous(
    limits = c(
      # Set lower limit of y-axis
      min(df_set2$Yc - df_set2$Yr) - 10,
      # Set upper limit of y-axis
      max(df_set2$Yc + df_set2$Yr) + 10
    ),
    # Set number of y-axis breaks to 8
    n.breaks = 8
  ) +
  # Set title and text size of x and y axis
  theme(
    axis.title.x = element_text(size = 16),
    axis.text.x = element_text(size = 14),
    axis.title.y = element_text(size = 16),
    axis.text.y = element_text(size = 14)
  )

# Setting 3 data simulating
set.seed(1)

df_set3 <- set3(
  n = 500,
  Xc_a = 5, Xc_b = 1,
  ec_a = 0, ec_b = 6 / 4,
  Xr_a = .1, Xr_b = .25,
  er_a = 0, er_b = 4 * .1
)
# Plot Y vs X
set3_p <- IntRF::int_plot(
  # Select relevant columns from prices dataframe
  int_data = df_set3 %>%
    select(Yc, Yr, Xc, Xr),
  title = "Setting 3",
  xlabel = "[X]",
  ylabel = "[Y]"
) +
  ggplot2::scale_x_continuous(
    limits = c(
      # Set lower limit of x-axis
      min(df_set3$Xc - df_set3$Xr) - .25,
      # Set upper limit of x-axis
      max(df_set3$Xc + df_set3$Xr) + .25
    ),
    # Set number of x-axis breaks to 10
    n.breaks = 10,
    # Wrap x-axis labels to fit within 6 lines
  ) +
    labels = scales::label_wrap(6)
  ggplot2::scale_y_continuous(
    limits = c(
      # Set lower limit of y-axis
      min(df_set3$Yc - df_set3$Yr) - 2,
      max(df_set3$Yc + df_set3$Yr) + 2 # Set upper limit of y-axis
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

# setting 1
pdf(file = "./Analysis/Simulation/figs/set1_fig.pdf")
set1_p +
  theme(aspect.ratio = .8)
dev.off()

# setting 2
pdf(file = "./Analysis/Simulation/figs/set2_fig.pdf")
set2_p +
  theme(aspect.ratio = .8)
dev.off()

# setting 3
pdf(file = "./Analysis/Simulation/figs/set3_fig.pdf")
set3_p +
  theme(aspect.ratio = .8)
dev.off()

# settings 1,2, and 3
pdf(file = "./Analysis/Simulation/figs/set123_fig.pdf")
gridExtra::grid.arrange(set1_p, set2_p, set3_p,
  ncol = 1,
  widths = unit(10, c("cm")),
  heights = c(
    unit(10, c("cm")),
    unit(10, c("cm")),
    unit(10, c("cm"))
  )
)
dev.off()
