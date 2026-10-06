#include <stdio.h>

/* 
 * conditional - same as x ? y : z 
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */

int conditional(int x, int y, int z) {
  int a = !x; 
  int mask = (a << 31) >> 31;
  return (y & ~mask) + (z & mask);
}

int main() {
    printf("%i\n", conditional(2,4,5));
}