library(Rcpp)
library(microbenchmark)

cppFunction("
double sumCpp(Rcpp::NumericVector vec) {
  double sum;
  for (auto &i: vec) {
    sum += i;
  }
  
  return sum;
}")

x <- c(1,2,3)
sumCpp(x)
y <- runif(1e5)
sumCpp(y)

microbenchmark::microbenchmark(sumCpp(y), sum(y))
