#---- set up libraries----------------------------------------------------------
library(mmalign)
library(io)
library(readr)

#---- read files ---------------------------------------------------------------
input_matrix <- read.csv("matrix.csv", row.names = 1)
input_group <- read.csv("group.csv")

#---- set up parameters --------------------------------------------------------
filename <- 'test' # set up file name
width <- 6

#---- pca function--------------------------------------------------------------
pca <- function(input_matrix,input_group,width,filename){
  pc <- mmalign::pca(input_matrix)
  qdraw(
    mmalign::pca_plot(pc, input_group, aes(colour=group)) +
      coord_fixed()
    ,
    width = width,
    file = insert(filename, tag=c("pca12"), ext="pdf")
  )
}

#---- pca ----------------------------------------------------------------------
pca(input_matrix,input_group,width,filename)
