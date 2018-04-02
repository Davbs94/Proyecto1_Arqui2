#ifndef _IMAGE_H
#define _IMAGE_H

#include <opencv2/opencv.hpp>

namespace imageCrypt
{
    void encryptXOR(cv::Mat*, int);
    void encryptSShift(cv::Mat*, int, bool);
    void encryptCShift(cv::Mat*, int, bool);
    void encryptSum(cv::Mat*, int*, bool);
}

#endif