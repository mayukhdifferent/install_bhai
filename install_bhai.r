# install_bhai function: install and load multiple R packages.
# check to see if packages are installed. Install them if they are not, then load them into the R session.

install_bhai <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg)) 
        install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
}

# usage
packages <- c("ggplot2","animation")
install_bhai(packages)

# If pcaMethods from BiocManager as not available in CRAN
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("pcaMethods")

