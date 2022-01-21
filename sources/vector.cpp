/*
Heru Handika
15 February 2021
Vector operation
*/

#include<Rcpp.h>
#include <iostream>
#include <vector>
#include <cassert>
#include <cmath>

using namespace std;

// [[Rcpp::export]]
vector<double> vector_ones(size_t arr_size)
{
    vector<double> res;
    res.reserve(arr_size);

    for (size_t i = 0; i < arr_size; i++)
    {
        res.push_back(1);
    }

    return res;
}

// [[Rcpp::export]]
vector<double> add_vector(vector<double> x, vector<double> y)
{
    assert(x.size() == y.size());
    vector<double> res;
    res.reserve(x.size());

    for (size_t i = 0; i < x.size(); i++)
    {
        res.push_back(x[i] + y[i]);
    }

    return res;
}

// [[Rcpp::export]]
vector<double> substract_vector(vector<double> x, vector<double> y)
{
    assert(x.size() == y.size());
    vector<double> res;
    res.reserve(x.size());

    for (size_t i = 0; i < x.size(); i++)
    {
        res.push_back(x[i] - y[i]);
    }

    return res;
}

// [[Rcpp::export]]
vector<double> multiply_vector(vector<double> x, vector<double> y)
{
    assert(x.size() == y.size());
    vector<double> res;
    res.reserve(x.size());

    for (size_t i = 0; i < x.size(); i++)
    {
        res.push_back(x[i] * y[i]);
    }

    return res;
}

// [[Rcpp::export]]
double sum(vector<double> vec)
{
    double res = 0;
    for (auto &i : vec)
    {
        res += i;
    }

    return res;
}

// [[Rcpp::export]]
vector<double> cumsum_cpp(vector<double> vec)
{
    vector<double> res;

    double sum = 0;
    for (auto &i : vec)
    {
        sum += i;
        res.push_back(sum);
    }

    return res;
}

// [[Rcpp::export]]
double mean_cpp(vector<double> vec)
{
    double total = sum(vec);

    return total / vec.size();
}

// [[Rcpp::export]]
double dot_product(vector<double> x, vector<double> y)
{
    assert(x.size() == y.size());
    double sum = 0.0;
    for (size_t i = 0; i < x.size(); i++)
    {
        sum += x[i] * y[i];
    }

    return sum;
}

// [[Rcpp::export]]
double sum_of_square(vector<double> a)
{
    return dot_product(a, a);
}

double magnitude(vector<double> a)
{
    return sqrt(sum_of_square(a));
}

// [[Rcpp::export]]
double distance(vector<double> x, vector<double> y)
{
    vector<double> subs = substract_vector(x, y);
    return magnitude(subs);
}