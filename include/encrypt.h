#ifndef _ENCRYPT_H
#define _ENCRYPT_H

#include <bitset>

namespace encrypt
{
    typedef std::bitset<8> BYTE;
    typedef std::bitset<16> INT;

    static INT toBin(int);
    static int toDec(INT);
    int encryptXOR(int, int);
    int encryptSShift(int, int, bool);
}

#endif