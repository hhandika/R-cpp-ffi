library(Rcpp)
library(microbenchmark)

sourceCpp("sources/vector.cpp")

## Functions 
sumOfSquareR <- function(vec) {
   sum(x^2)
}

euclideanDist <- function(x, y) {
  sqrt(sum((a - b)^2))
}

geomMeanR <- function(x) {
  exp(mean(log(x)))
}

## Test
vec <- c(1,2,3)
n <- 5

vector_ones(8)
sum_of_square(vec)

x <- rpois(1e6,5)

sum_of_square(x)
sumOfSquareR(x)

dot_product(x, x)

## Benchmark
microbenchmark(
  sum_of_square(x),
  sumOfSquareR(x)
)

microbenchmark(
  vector_ones(1e3),
  vector_ones_rev(1e3),
  replicate(1e3, 1),
  rep(1, 1e3)
)

a <- rpois(1e4,5)
b <- rpois(1e4,5)

microbenchmark(
  distance(a, b),
  euclideanDist(a, b)
)

microbenchmark(
  geomMeanCpp(a),
  geomMeanR(a)
)

