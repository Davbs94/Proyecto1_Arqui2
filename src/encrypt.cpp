#include <bitset>
#include <stdexcept>
#include "../include/encrypt.h"

static encrypt::INT encrypt::toBin(int value)
{
    encrypt::INT result(value);
    return result;
}

static int encrypt::toDec(encrypt::INT value)
{
    return (int)(value.to_ulong());
}

int encrypt::encrypt(int originalValue, int key)
{
    if (key > 256)
    {
        throw std::invalid_argument( "Key value must be an 8 bit integer (Max value: 256)" );
    }
    encrypt::INT keyBin = toBin(key);
    encrypt::INT binaryOgValue = toBin(originalValue);
    return toDec(binaryOgValue ^ keyBin);
}