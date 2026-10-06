#include <stdio.h>

int main() {
    int a;
    scanf("%X", &a);
    printf("\n you have the given number %X", a); 

    int mask = 31, newNumber; 
    newNumber = a & mask; 

    printf("\n new number = %d in hex = 0x%X\n", newNumber, newNumber);
}