#include<stdio.h> 
#include<math.h> 
int main() 
{ 
   float num = 5.48958123; 
  
   // 4 digits after the decimal point 
   num = floor(10000*num)/10000; 
  
   printf("%f", num); 
   return 0; 
}
