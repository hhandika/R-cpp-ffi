library(Rcpp)
library(microbenchmark)


cppFunction(
  "
double sumCpp(Rcpp::NumericVector vec) {
  double sum;
  for (auto &i: vec) {
    sum += i;
  }

  return sum;
}"
)

cppFunction(
  "
    double sumArr(Rcpp::NumericVector vec) {
    double sum = 0;
    return std::accumulate(vec.begin(), vec.end(), sum);
  }"
)

sumR <- function(x) {
  total <- 0
  for (i in x) {
    total <- total + i
  }
  total
}

x <- c(1, 2, 3)
sumCpp(x)
sumCpp(x)
sumArr(x)
sumR(x)

y <- runif(1e5)
microbenchmark::microbenchmark(
  sumR(y),
  sumCpp(y), 
  sumArr(y),
  sum(y)
  )
