library(Rcpp)
library(microbenchmark)

sourceCpp("sources/vector.cpp")

sumOfSquareR <- function(vec) {
   sum(x^2)
}

euclideanDist <- function(x, y) {
  sqrt(sum((a - b)^2))
}

vec <- c(1,2,3)
n <- 5

vector_ones(8)
sum_of_square(vec)

x <- rpois(1e6,5)
x

sum_of_square(x)
sumOfSquareR(x)

dot_product(x, x)
dot(x,x)

microbenchmark(
  sum_of_square(x),
  sumOfSquareR(x)
)

microbenchmark(
  vector_ones(1e5),
  replicate(1e5, 1),
  rep(1, 1e5)
)

a <- rpois(1e6,5)
b <- rpois(1e6,5)

microbenchmark(
  distance(a, b),
  euclideanDist(a, b)
)


