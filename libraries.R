if (!require("vcfR")) {
  install.packages("vcfR")
}

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("BiocManager")) {
  install.packages("BiocManager")
}

if (!require("shiny")) {
  BiocManager::install("shiny")
}

if (!require("shinydashboard")) {
  BiocManager::install("shinydashboard")
}

if (!require("bslib")) {
  BiocManager::install("bslib")
}

if (!require("shinyWidgets")) {
  BiocManager::install("shinyWidgets")
}

if (!require("DT")) {
  BiocManager::install("DT")
}

if (!require("dplyr")) {
  BiocManager::install("dplyr")
}

if (!require("shinyFiles")) {
  install.packages("shinyFiles")
}

library("vcfR")
library("data.table")
library("shiny")
library("bslib")
library("shinydashboard")
library("shinyWidgets")
library("DT")
library("dplyr")
library("shinyFiles")