#include <stdio.h>
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
    int y = x >> n; 
    int mask = ~(~0 << (32 + (~n + 1)));
    return y & mask; 
}

int main(){
    printf("0x%08x\n", logicalShift(0x21354321, 8));
}