#include <stdio.h>
#include <bitset>
#include <opencv2/opencv.hpp>
#include "./include/encrypt.h"

int main()
{
    int key = 89;
    cv::Mat image, image_gray;
    image = cv::imread("/home/andres/Documents/ArquiII/Proyecto1_Arqui2/lenna.png", 1);
    cv::cvtColor(image, image_gray, CV_RGB2GRAY);

    if (!image.data)
    {
        std::cout << "Error abriendo la imagen" << std::endl;
        return -1;
    }

    int pixel[image_gray.rows][image_gray.cols];
    for (int i = 0; i < image_gray.rows; ++i)
    {
        for (int j = 0; j < image_gray.cols; ++j)
        {
            try
            {
                int result = encrypt::encrypt(image_gray.at<uchar>(i, j), key);
                image_gray.at<uchar>(i, j) = result;
            }
            catch (std::invalid_argument& exc)
            {
                std::cout << exc.what() << std::endl;
            }
        }
    }

    cv::namedWindow("Image result", cv::WINDOW_AUTOSIZE);
    cv::imshow("Image result", image_gray);

    cv::waitKey(0);

    return 0;
}