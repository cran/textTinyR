% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{sparse_Means}
\alias{sparse_Means}
\title{RowMens and colMeans for a sparse matrix}
\usage{
sparse_Means(sparse_matrix, rowMeans = FALSE)
}
\arguments{
\item{sparse_matrix}{a sparse matrix}

\item{rowMeans}{either TRUE or FALSE. If TRUE then the row-means will be calculated, otherwise the column-means}
}
\value{
a vector with either the row- or the column-sums of the matrix
}
\description{
RowMens and colMeans for a sparse matrix
}
\examples{

library(textTinyR)

tmp = matrix(sample(0:1, 100, replace = TRUE), 10, 10)

sp_mat = dense_2sparse(tmp)

spsm = sparse_Means(sp_mat, rowMeans = FALSE)
}
