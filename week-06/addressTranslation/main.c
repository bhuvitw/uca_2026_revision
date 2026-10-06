#include <stdio.h>
#include <stdint.h>

void address_translation(uint32_t virtual_address);

int main(){
    address_translation(0x00000000);
    address_translation(0x00000FFF);
    address_translation(0x00001000);
    address_translation(0x00003A2C);
}