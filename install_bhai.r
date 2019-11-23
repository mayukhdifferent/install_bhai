# install_bhai function: install and load multiple R packages.
# check to see if packages are installed. Install them if they are not, then load them into the R session.

install_bhai <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg)) 
        install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
}

# usage
packages <- c("ggplot2","pcaMethods","animation")
install_bhai(packages)

# If pcaMethods shows FALSE then run below 
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

