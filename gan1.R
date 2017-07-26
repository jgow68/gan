# https://arxiv.org/pdf/1701.00160.pdf
# http://dmlc.ml/rstats/2017/06/01/Generative-Adversarial-Network-in-R.html

# load packages
install.packages("imager")
install.packages("dplyr")
install.packages("readr")

# install mxnet
cran <- getOption("repos")
cran["dmlc"] <- "https://s3-us-west-2.amazonaws.com/apache-mxnet/R/CRAN/"
options(repos = cran)
install.packages("mxnet")

require("imager")
require("dplyr")
require("readr")
require("mxnet")


# data prep ---------------------------------------------------------------

train <- read_csv('train.csv') # data source is from: https://www.kaggle.com/c/digit-recognizer/data
train <- data.matrix(train)

train_data <- train[,-1]
train_data <- t(train_data/255*2-1)
train_label <- as.integer(train[,1])

dim(train_data) <- c(28, 28, 1, ncol(train_data))
