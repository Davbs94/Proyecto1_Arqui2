#ifndef _ENCRYPT_H
#define _ENCRYPT_H

#include <bitset>

namespace encrypt
{
    typedef std::bitset<8> BYTE;
    typedef std::bitset<16> INT;

    static INT toBin(int);
    static int toDec(INT);
    static int numDigits(int);
    int encryptXOR(int, int);
    int encryptSShift(int, int, bool);
    int encryptCShift(int, int, bool);
    int encryptSum(int, int, bool);
}

#endif