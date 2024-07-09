#/bin/env R

install.packages(c('argparse','scales','ggplot2', 'BiocManager', 'gtools', 'ggnewscale', 'reshape2'))

BiocManager::install("GenomicRanges")
