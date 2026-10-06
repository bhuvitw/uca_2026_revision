#include <stdio.h>

/* 
 * bitXor - x^y using only ~ and & 
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y) {
    int a = (~x & y);
    int b = (x & ~y);
  return ~(~a & ~b);
}

int main(){
    printf("%i\n", bitXor(110,66)); 
}