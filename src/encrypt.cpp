#include <bitset>
#include <stdexcept>
#include "../include/encrypt.h"

/** Converts a simple integer into a 16 bit binary value.
 * @param value The integer value.
 * @return The resulting 16 bit binary.
 */
static encrypt::INT encrypt::toBin(int value)
{
    encrypt::INT result(value);
    return result;
}

/** Converts a 16 bit binary value to an integer.
 * @param value The 16 bit binary value.
 * @return The resulting integer.
 */
static int encrypt::toDec(encrypt::INT value)
{
    return (int)(value.to_ulong());
}

/** Encrypts the value of an integer by applying
 * an XOR operation between said integer and an 8 bit key.
 * @param originalValue The integer value about to be encrypted.
 * @param key The 8 bit key value (Max value: 256).
 * @return The resulting 16 bit binary.
 */
int encrypt::encryptXOR(int originalValue, int key)
{
    if (key > 256)
    {
        throw std::invalid_argument( "Key value must be an 8 bit integer (Max value: 256)" );
    }
    encrypt::INT keyBin = toBin(key);
    encrypt::INT binaryOgValue = toBin(originalValue);
    return toDec(binaryOgValue ^ keyBin);
}