#!/usr/bin/env Rscript

# CRAN packages
install.packages(c(
	"scales",
	"ggrepel",
	"ggplot2",
	"cowplot",
	"gggenes",
	"ggnewscale",
	"RColorBrewer",
	"gtools"
	), repos = "https://cloud.r-project.org")

# Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE))
	    install.packages("BiocManager", repos = "https://cloud.r-project.org")

BiocManager::install(c(
	"ggbio",
	"biovizBase",
	"GenomicRanges"
	))

