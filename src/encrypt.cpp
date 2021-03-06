#include <bitset>
#include <stdexcept>
#include "../include/encrypt.h"

/** Converts a simple integer into a 16 bit binary value.
 * @param value The integer value.
 * @return The resulting 16 bit binary.
 */
static encrypt::INT encrypt::toBin(int value)
{
    INT result(value);
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
 * @param originalValue The integer value to be encrypted.
 * @param key The 8 bit key value (Max value: 256).
 * @return The resulting encrypted integer.
 */
int encrypt::encryptXOR(int originalValue, int key)
{
    INT keyBin = toBin(key);
    INT binaryOgValue = toBin(originalValue);
    return toDec(binaryOgValue ^ keyBin);
}

/** Encrypts the value of an integer by applying
 * a simple binary shift operation. Warning: This method causes data loss.
 * @param originalValue The integer value to be encrypted.
 * @param offset The amount of positions the value will be shifted (Between 1 and 7).
 * @param right If true will shift to the right, if false will shift to the left.
 * @return The resulting encrypted integer.
 */
int encrypt::encryptSShift(int originalValue, int offset, bool right)
{
    INT binaryOgValue = toBin(originalValue);
    if (right)
    {
        return toDec(binaryOgValue >> offset);
    }
    else
    {
        return toDec(binaryOgValue << offset);
    }
}

/** Encrypts the value of an integer by applying
 * a circular binary shift operation.
 * @param originalValue The integer value to be encrypted.
 * @param offset The amount of positions the value will be shifted (Between 1 and 7).
 * @param right If true will shift to the right, if false will shift to the left.
 * @return The resulting encrypted integer.
 */
int encrypt::encryptCShift(int originalValue, int offset, bool right)
{
    INT binaryOgValue = toBin(originalValue);
    if (right)
    {
        // 16 = The number of bits.
        return toDec(binaryOgValue >> offset | binaryOgValue << (16 - offset));
    }
    else
    {
        return toDec(binaryOgValue << offset | binaryOgValue >> (16 - offset));
    }
}

/** Applies the simple sum encryption algorithm to a given OpenCV matrix.
 * Warning: Causes data loss. If sum result is greater than 255, 255 will be taken as a result.
 * Negative case: If sum result is negative, 0 will be taken as a result.
 * @param originalValue The pixel's original value..
 * @param sumVaue The value to sum.
 * @param sum If true will sum positive, if false will sum negative.
 */
int encrypt::encryptSum(int originalValue, int sumValue, bool sum)
{
    if (sum)
    {
        int result = originalValue + sumValue;
        if (result > 255)
        {
            return 255;
        }
        else
        {
            return result;
        }
    }
    else
    {
        int result = originalValue - sumValue;
        if (result < 0)
        {
            return 0;
        }
        else
        {
            return result;
        }
    }
}
    