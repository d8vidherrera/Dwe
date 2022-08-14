#include <iostream>
#include <cmath>
using namespace std;

double funct (double x) {
    return pow(x-3,3) - 3;}
double derivative (double x) {
    return 3*pow(x,2) - 18*x +27;} 

double newtonsMethod(
    double x,double func, double der, int k, double trol) {
    int i = 0;
    double xn = x - (funct(x) / derivative(x));
    while ( std::abs(xn - x) > trol && i < k )  {
        x = xn;
        xn = x - (funct(x) / derivative(x));
        i++;
        /* cout << xn <<endl; */
    }
    return xn;
}   

int main() {
    int k = 30; 
    double x = 3.2;
    double trol = 0.00001;
    double func = funct(x);
    double der = derivative(x);
    cout << "Result: "<< newtonsMethod(x,func,der,k,trol) << endl;
    return 0;
}