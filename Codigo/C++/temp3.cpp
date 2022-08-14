#include <iostream>
#include <cmath>
using namespace std;

void dwe(){
   int max = 20;
   double a = 10;
   double b = 0.1;
   int i = 0;

   while ( i < max ){

      a -= b;
      cout << "A: " << a ;
      cout << "     ABS: " << std::abs(a-b);
      cout << "     i: " << i << endl;
      i++;
   }

}

int main(){
   dwe();
}