library(ggplot2)
library(ggpubr)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

###########################################################
# Figure 1: Clustering, trajectory inference, DE analysis #
###########################################################
# Read all plot files
clust <- readRDS("./../saved/R_objects/clustering_umap_plot")
clust.cc <- readRDS("./../saved/R_objects/clustering_umap_plot_cc")

p.primary <- readRDS("./../saved/R_objects/trajectory_plot_primary")
p.primary.cc <- readRDS("./../saved/R_objects/trajectory_plot_primary_cc")
p.dellOrso <- readRDS("./../saved/R_objects/trajectory_plot_deMicheli")
p.deMicheli <- readRDS("./../saved/R_objects/trajectory_plot_dellOrso_f")

p.de <- readRDS("./../saved/R_objects/de_genes_plot_control")

# Combine clustering and DE plots
clust.plots <- ggarrange(clust, clust.cc, labels = c("A", "B"), ncol = 1, nrow = 2, align = "hv")
de.plots <- ggarrange(p.de[[4]], labels = c("C"), ncol = 1)

clust.de.plots <- ggarrange(clust.plots, de.plots,
                            ncol = 2, nrow = 1, align = "hv")
# Combine trajectory plots
traj.plots <- ggarrange(p.primary, p.primary.cc, p.dellOrso, p.deMicheli,
                        ncol = 2, nrow = 2, align = "hv",
                        labels = c("D", "E", "F", "G"))

# Combine the combined plots
figure1 <- ggarrange(clust.de.plots, traj.plots, ncol = 1, nrow = 2, align = "hv")

# Save as pdf
pdf("./../saved/figures/thesis_figure_1.pdf", width = 20, height = 30)
figure1
dev.off()

pdf("./../saved/figures/thesis_figure_1_clust_de_plots.pdf", width = 13, height = 11)
clust.de.plots
dev.off()

traj.plots2 <- ggarrange(p.primary + theme(legend.position = "none"), p.primary.cc, p.dellOrso, p.deMicheli,
                        ncol = 2, nrow = 2, align = "h",
                        labels = c("A", "B", "C", "D"))

pdf("./../saved/figures/thesis_figure_1_traj_plots.pdf", width = 18, height = 14)
traj.plots2
dev.off()

# Without cc corrected
traj.plots3a <- ggarrange(p.primary, p.dellOrso,
                         ncol = 2, nrow = 1, align = "h",
                         labels = c("A", "B"))
traj.plots3b <- ggarrange(p.deMicheli,
                          ncol = 1, nrow = 1,
                          labels = c("C"))                         

traj.plots3.final <- ggarrange(traj.plots3a, traj.plots3b,
                               ncol = 1, nrow = 2, align = "h")

pdf("./../saved/figures/thesis_figure_1_traj_plots_without_cc.pdf", width = 18, height = 14)
traj.plots3.final
dev.off()

###########################################################
# Figure 2: Cell annotation balloon plots and trajectories
###########################################################
# Read all plot files
balloon.deMicheli <- readRDS("./../saved/R_objects/plot_balloon_deMicheli")
balloon.dellOrso <- readRDS("./../saved/R_objects/plot_balloon_dellOrso")
balloon.dellOrso.f <- readRDS("./../saved/R_objects/plot_balloon_dellOrso_f")
balloon.segments.d5 <- readRDS("./../saved/R_objects/plot_balloon_segments_d5")
traj.plot.d5 <- readRDS("./../saved/R_objects/plot_cell_annotation_trajectory_d5")

# Combine balloon plots
balloon.plots1 <- ggarrange(balloon.deMicheli + theme(legend.position = "none"),
                            balloon.dellOrso,
                            ncol = 2, nrow = 1, align = "hv", labels = c("A", "B"))

balloon.plots2 <- ggarrange(balloon.dellOrso.f + theme(legend.position = "none"),
                            balloon.segments.d5 + theme(legend.position = "none"),
                            ncol = 2, nrow = 1, align = "hv", labels = c("C", "D"))

traj.plot <- ggarrange(traj.plot.d5, labels = c("E"), ncol = 1, nrow = 1)

# Combine trajectory and balloon plots
figure2 <- ggarrange(balloon.plots1, balloon.plots2, traj.plot, align = "hv", nrow = 3, ncol = 1)

# Save as pdf
pdf("./../saved/figures/thesis_figure_2.pdf", width = 10, height = 12)
figure2
dev.off()


###########################################################
# Figure 3: Cell annotation balloon plots and trajectories
###########################################################
# Read all plot files
balloon.deMicheli.m <- readRDS("./../saved/R_objects/plot_balloon_deMicheli_m")
de.important.m.genes <- readRDS("./../saved/R_objects/plot_de_important_m_genes")
v.table <- readRDS("./../saved/R_objects/venn_metabolic_genes")
v.table.f <- readRDS("./../saved/R_objects/venn_metabolic_genes_f")

balloon.de.plot <- ggarrange(balloon.deMicheli.m + ggtitle("", subtitle = ""),
                             de.important.m.genes[[4]],
                             NULL,
                             NULL,
                             ncol = 2, nrow = 2, labels = c("A", "B", "C", "D"))

# Save as pdf
pdf("./../saved/figures/thesis_figure_3.pdf", width = 10, height = 10)
balloon.de.plot
dev.off()



###########################################################
# Extra: SingleR annotations
###########################################################
# Read all plot files
# Combine balloon plots
balloon.plots1.new <- ggarrange(balloon.deMicheli + theme(legend.position = "none"),
                            balloon.deMicheli.m + ggtitle("", subtitle = ""),
                            ncol = 2, nrow = 1, align = "hv", labels = c("A", "B"))

# Combine trajectory and balloon plots
figure2.new <- ggarrange(balloon.plots1.new, balloon.plots2, traj.plot, align = "hv", nrow = 3, ncol = 1)

pdf("./../saved/figures/thesis_figure_extra_balloon_plots.pdf", width = 10, height = 12)
figure2.new
dev.off()



###########################################################
# Figure 5: Pathway expression dynamics
###########################################################
p.primary.pathways.important <- readRDS("./../saved/R_objects/plot_primary_pathways_important")
p.deMicheli.pathways.important <- readRDS("./../saved/R_objects/plot_deMicheli_pathways_important")
p.deMicheli.pathways.important.f <- readRDS("./../saved/R_objects/plot_deMicheli_pathways_important_f")
p.dellOrso.pathways.important.f <- readRDS("./../saved/R_objects/plot_dellOrso_pathways_important")

figure5 <- ggarrange(p.primary.pathways.important[[4]],
                     p.deMicheli.pathways.important[[4]],
                     p.deMicheli.pathways.important.f[[4]],
                     p.dellOrso.pathways.important.f[[4]],
                     ncol = 2, nrow = 2, labels = c("A", "B", "C", "D"))

pdf("./../saved/figures/thesis_figure_5.pdf", width = 18, height = 7)
figure5
dev.off()

figure5_venn <- ggarrange(p.primary.pathways.important[[4]],
                     p.deMicheli.pathways.important[[4]],
                     p.deMicheli.pathways.important.f[[4]],
                     p.dellOrso.pathways.important.f[[4]],
                     NULL,NULL,
                     ncol = 2, nrow = 3, labels = c("A", "B", "C", "D", "E", "F"))

pdf("./../saved/figures/thesis_figure_5_venn.pdf", width = 18, height = 10)
figure5_venn
dev.off()
