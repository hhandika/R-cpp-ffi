library(Rcpp)

cppFunction("
int sumC(NumericVector vec) {
  int sum;
  for (auto &i: vec.size()) {
    sum += i;
  }
  
  return sum;
}")

x <- runif(1e5)
sumCpp(x)
