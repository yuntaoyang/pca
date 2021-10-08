#---- set up libraries----------------------------------------------------------
library(mmalign)
library(io)
library(readr)

#---- read files ---------------------------------------------------------------
matrix <- read.csv("matrix.csv", row.names = 1)
group <- read.csv("group.csv")

#---- set up parameters --------------------------------------------------------
filename <- 'test' # set up file name
input_matrix <- matrix
input_group <- group

#---- pca ----------------------------------------------------------------------
pc <- mmalign::pca(input_matrix)
qdraw(
  mmalign::pca_plot(pc, input_group, aes(colour=group)) +
    coord_fixed()
  ,
  width = 6,
  file = insert('test', tag=c("pca12"), ext="pdf")
)
