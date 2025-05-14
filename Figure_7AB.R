# Load necessary libraries
library(ggmsa)
library(png)
library(grid)
library(ggplot2)
library(cowplot)
library(aplot) 
# Load the image and create ggplot from raster
img <- readPNG("Sars_Cov_2.png")
img_raster <- rasterGrob(img, interpolate = TRUE)
image_plot <- ggdraw(img_raster)
# Generate the ggmsa plot (returns an aplot object)
my_plot <- ggmsa(
  msa = "Sars_cov_2_aligned_S_gene.fasta",
  start = 1,
  end = 200,
  font = "helvetical",
  color = "Chemistry_AA",
  char_width = 0.5
) +
  geom_seqlogo(color = 'Chemistry_AA') +
  geom_msaBar()
my_plot_2 <- ggmsa(
  msa = "Sars_cov_2_aligned_S_gene.fasta",
  start = 319,
  end = 541,
  font = "helvetical",
  color = "Chemistry_AA",
  char_width = 0.5
) +
  geom_seqlogo(color = 'Chemistry_AA') +
  geom_msaBar()
p1 <- ggmsa(
  msa = "Sars_cov_2_aligned_S_gene.fasta",
  start = 1,
  end = 200,
  font = "helvetical",
  color = "Chemistry_AA",
  char_width = 0.5
) +
  geom_seqlogo(color = 'Chemistry_AA')
p2 <- ggmsa(
  msa = "Sars_cov_2_aligned_S_gene.fasta",
  start = 477,
  end = 777,
  font = "helvetical",
  color = "Chemistry_AA",
  char_width = 0.5
) +
  geom_seqlogo(color = 'Chemistry_AA')
# Convert the aplot to ggplot
my_plot_1 <- as.patchwork(my_plot_2)
my_plot_2 <- as.patchwork(p2)
# Combine using cowplot's plot_grid
final_plot <- plot_grid(
  image_plot,
  my_plot_1,
  labels = c("A", "B"),
  ncol = 2,
  rel_widths = c(1, 3)
)
# Display
final_plot
