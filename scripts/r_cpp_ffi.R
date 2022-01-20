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

cppFunction("
  double geomMeanCpp(Rcpp::NumericVector vec) {
      size_t n = vec.size();
      double slog = 0.0;
      for (auto &i: vec) {
        slog += log(i);
      }
      return exp(slog/n);
    }
")

sumR <- function(x) {
  total <- 0
  for (i in x) {
    total <- total + i
  }
  total
}

geomMeanR <- function(x) {
  exp(mean(log(x)))
}

x <- c(1, 2, 3)
sumCpp(x)
sumArr(x)
sumR(x)

cumsumCpp(x)
geomMeanCpp(x)
geomMeanR(x)

y <- runif(1e5)
microbenchmark(
  sumR(y),
  sumCpp(y), 
  sumArr(y),
  sum(y)
  )

z <- runif(1e3)
microbenchmark(
  base::cumsum(z),
  cumsumCpp(z)
)

a <- runif(1e6)
microbenchmark(
  geomMeanCpp(a),
  geomMeanR(a)
)


