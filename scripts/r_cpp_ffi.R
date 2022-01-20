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

cppFunction(
  "
  Rcpp::NumericVector cumsumCpp(Rcpp::NumericVector vec) {
    Rcpp::NumericVector res;
    double sum = 0;
    for (auto &i : vec) {
      sum += i;
      res.push_back(sum);
    }
    return res;
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
sumArr(x)
sumR(x)

cumsumCpp(x)

y <- runif(1e5)
microbenchmark::microbenchmark(
  sumR(y),
  sumCpp(y), 
  sumArr(y),
  sum(y)
  )

microbenchmark::microbenchmark(
  base::cumsum(y),
  cumsumCpp(y)
)


