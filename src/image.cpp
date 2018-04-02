#include <opencv2/opencv.hpp>
#include "../include/encrypt.h"
#include "../include/image.h"

/** Applies the XOR encryption algorithm to a given OpenCV matrix.
 * @param image The OpenCV matrix to be encrypted.
 * @param key The 8 bit key value (Max value: 256).
 */
void imageCrypt::encryptXOR(cv::Mat *image, int key)
{
    if (key > 256)
    {
        throw std::invalid_argument("Key value must be an 8 bit integer (Max value: 256)");
    }
    else
    {
        for (int i = 0; i < (*image).rows; ++i)
        {
            for (int j = 0; j < (*image).cols; ++j)
            {
                (*image).at<uchar>(i, j) = encrypt::encryptXOR((*image).at<uchar>(i, j), key);
            }
        }
    }
}

/** Applies the simple shift encryption algorithm to a given OpenCV matrix.
 * Warning: This method causes data loss.
 * @param image The OpenCV matrix to be encrypted.
 * @param offset The amount of positions the value will be shifted (Between 1 and 7).
 * @param right If true will shift to the right, if false will shift to the left.
 */
void imageCrypt::encryptSShift(cv::Mat *image, int offset, bool right)
{
    if (offset < 1 || offset > 7)
    {
        throw std::invalid_argument("Offset value must be a number between 1 and 7.");
    }
    else
    {
        for (int i = 0; i < (*image).rows; ++i)
        {
            for (int j = 0; j < (*image).cols; ++j)
            {
                (*image).at<uchar>(i, j) = encrypt::encryptSShift((*image).at<uchar>(i, j), offset, right);
            }
        }
    }
}

/** Applies the circular encryption algorithm to a given OpenCV matrix.
 * @param image The OpenCV matrix to be encrypted.
 * @param offset The amount of positions the value will be shifted (Between 1 and 7).
 * @param right If true will shift to the right, if false will shift to the left.
 */
void imageCrypt::encryptCShift(cv::Mat *image, int offset, bool right)
{
    if (offset < 1 || offset > 7)
    {
        throw std::invalid_argument("Offset value must be a number between 1 and 7.");
    }
    else
    {
        for (int i = 0; i < (*image).rows; ++i)
        {
            for (int j = 0; j < (*image).cols; ++j)
            {
                (*image).at<uchar>(i, j) = encrypt::encryptCShift((*image).at<uchar>(i, j), offset, right);
            }
        }
    }
}

/** Applies the simple sum encryption algorithm to a given OpenCV matrix.
 * Warning: Causes data loss. If sum result is greater than 255, 255 will be taken as a result.
 * Negative case: If sum result is negative, 0 will be taken as a result.
 * @param image The OpenCV matrix to be encrypted.
 * @param vector The 4 value vector to sum.
 * @param sum If true will sum positive, if false will sum negative.
 */
void imageCrypt::encryptSum(cv::Mat *image, int *vector, bool sum)
{
    int counter = 0;
    for (int i = 0; i < (*image).rows; ++i)
    {
        for (int j = 0; j < (*image).cols; ++j)
        {
            if (counter > 3)
            {
                counter = 0;
                (*image).at<uchar>(i, j) = encrypt::encryptSum((*image).at<uchar>(i, j), vector[counter], sum);
                counter++;
            }
            else
            {
                (*image).at<uchar>(i, j) = encrypt::encryptSum((*image).at<uchar>(i, j), vector[counter], sum);
                counter++;
            }
        }
    }
}