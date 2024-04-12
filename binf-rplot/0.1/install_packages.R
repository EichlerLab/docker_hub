#/bin/env R

install.packages(c('argparse','scales','ggplot2', 'BiocManager', 'gtools', 'ggnewscale'))

BiocManager::install("GenomicRanges")