#include <stdio.h>

/*
 * isPower2 - returns 1 if x is a power of 2, and 0 otherwise
 *   Examples: isPower2(5) = 0, isPower2(8) = 1, isPower2(0) = 0
 *   Note that no negative number is a power of 2.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int isPower2(int x) {
  int y = x-1 ; 

  return !((x & (x + ~0)) + ((x >> 31) & 1)  + !x ); 
}

int main(){
    printf("%i\n", isPower2(5)); 
    printf("%i\n", isPower2(8)); 
    printf("%i\n", isPower2(0)); 
}