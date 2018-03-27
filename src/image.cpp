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

/** Applies the XOR encryption algorithm to a given OpenCV matrix.
 * Warning: This method causes data loss.
 * @param image The OpenCV matrix to be encrypted.
 * @param offset The amount of positions the value will be shifted (Between 1 and 7).
 * @param right If true will shift to the right, if false will shift to the left.
 */
void imageCrypt::encryptSShift(cv::Mat *image, int offset, bool right)
{
    if (offset < 1 || offset > 7) // Esto se tiene que mover a image.cpp
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