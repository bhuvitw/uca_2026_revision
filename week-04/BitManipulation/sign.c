#include <stdio.h>

/* 
 * sign - return 1 if positive, 0 if zero, and -1 if negative
 *  Examples: sign(130) = 1
 *            sign(-23) = -1
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 10
 *  Rating: 2
 */
int sign(int x) {
    return (x >> 31) + !(x >> 31) -!x;
}

int main(){
    printf("%i\n", sign(130));
    printf("%i\n", sign(-23));
    printf("%i\n", sign(0));

}