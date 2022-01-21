/*
Heru Handika
15 February 2021
Vector operation
*/

#include <Rcpp.h>
#include <iostream>
#include <vector>
#include <cassert>
#include <cmath>

using namespace Rcpp;

// [[Rcpp::export]]
NumericVector vector_ones(int arr_size)
{
    NumericVector res = 0;

    for (int i = 0; i < arr_size; i++)
    {
        res.push_back(1);
    }

    return res;
}

// [[Rcpp::export]]
std::vector<size_t> vector_ones_rev(int arr_size)
{
  std::vector<size_t> res;
  res.reserve(arr_size);
  
  for (int i = 0; i < arr_size; i++)
  {
    res.push_back(1);
  }
  
  return res;
}

// [[Rcpp::export]]
NumericVector add_vector(NumericVector x, NumericVector y)
{
    assert(x.size() == y.size());
    NumericVector res = 0;

    for (int i = 0; i < x.size(); i++)
    {
        res.push_back(x[i] + y[i]);
    }

    return res;
}

// [[Rcpp::export]]
NumericVector substract_vector(NumericVector x, NumericVector y)
{
    assert(x.size() == y.size());
    NumericVector res = 0;

    for (int i = 0; i < x.size(); i++)
    {
        res.push_back(x[i] - y[i]);
    }

    return res;
}

// [[Rcpp::export]]
NumericVector multiply_vector(NumericVector x, NumericVector y)
{
    assert(x.size() == y.size());
    NumericVector res = 0;

    for (int i = 0; i < x.size(); i++)
    {
        res.push_back(x[i] * y[i]);
    }

    return res;
}

// [[Rcpp::export]]
double sum(NumericVector vec)
{
    double res = 0;
    for (auto &i : vec)
    {
        res += i;
    }

    return res;
}

// [[Rcpp::export]]
NumericVector cumsum_cpp(NumericVector vec)
{
    NumericVector res;

    double sum = 0;
    for (auto &i : vec)
    {
        sum += i;
        res.push_back(sum);
    }

    return res;
}

// [[Rcpp::export]]
double mean_cpp(NumericVector vec)
{
    double total = sum(vec);

    return total / vec.size();
}

// [[Rcpp::export]]
double dot_product(NumericVector x, NumericVector y)
{
    assert(x.size() == y.size());
    double sum = 0.0;
    for (int i = 0; i < x.size(); i++)
    {
        sum += x[i] * y[i];
    }

    return sum;
}

// [[Rcpp::export]]
double sum_of_square(NumericVector a)
{
    return dot_product(a, a);
}

double magnitude(NumericVector a)
{
    return sqrt(sum_of_square(a));
}

// [[Rcpp::export]]
double distance(NumericVector x, NumericVector y)
{
    NumericVector subs = substract_vector(x, y);
    return magnitude(subs);
}

// [[Rcpp::export]]
double geomMeanCpp(Rcpp::NumericVector vec)
{
    size_t n = vec.size();
    double slog = 0.0;
    for (auto &i : vec)
    {
        slog += log(i);
    }
    return exp(slog / n);
}
