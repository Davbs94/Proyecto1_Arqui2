#include <iostream>
#include <getopt.h>
#include <bitset>
#include <string>
#include <opencv2/opencv.hpp>
#include "./include/image.h"

void print_help()
{
    std::cout << std::endl
              << " Usage: %s [OPTIONS]" << std::endl
              << std::endl;
    std::cout << "  Options:" << std::endl;
    std::cout << "   -h --help                      Print this help" << std::endl;
    std::cout << "   -f --file filename             Path to the image to be encrypted." << std::endl;
    std::cout << "   -x --xor key                   Performs XOR encrypt with a given key." << std::endl;
    std::cout << "   -l --lsshift offset            Performs Simple left shift encrypt with a given offset." << std::endl;
    std::cout << "   -r --rsshift offset            Performs Simple right shift encrypt with a given offset." << std::endl;
    std::cout << std::endl;
}

int main(int argc, char *argv[])
{
    // This struct holds all available command line options.
    static struct option longOptions[] = {
        {"help", no_argument, NULL, 'h'},
        {"file", required_argument, NULL, 'f'},
        {"xor", required_argument, NULL, 'x'},
        {"lsshift", required_argument, NULL, 'l'},
        {"rsshift", no_argument, NULL, 'r'},
        {NULL, 0, NULL, 0}};
    int value, key, offset;
    cv::Mat image, image_gray;

    if (argc == 1) // If no arguments are passed, show the help dialog.
    {
        print_help();
        return -1;
    }

    // This while loop parses the given command line arguments and call the respective functions.
    while ((value = getopt_long(argc, argv, "f:x:", longOptions, NULL)) != -1)
    {
        switch (value)
        {
        case 'h':
            print_help();
            return 0;
        case 'f':
            image = cv::imread(optarg, 1);
            if (!image.data)
            {
                std::cout << "Error abriendo la imagen" << std::endl;
                return -1;
            }
            cv::cvtColor(image, image_gray, CV_RGB2GRAY);
            break;
        case 'x':
            key = std::stoi(optarg, NULL, 10);
            try
            {
                imageCrypt::encryptXOR(&image_gray, key);
            }
            catch (std::invalid_argument &exc)
            {
                std::cout << "ERROR: " << exc.what() << std::endl;
            }
            break;
        case 'r':
            offset = std::stoi(optarg, NULL, 10);
            try
            {
                imageCrypt::encryptSShift(&image_gray, offset, true);
            }
            catch (std::invalid_argument &exc)
            {
                std::cout << "ERROR: " << exc.what() << std::endl;
            }
            break;
        case 'l':
            offset = std::stoi(optarg, NULL, 10);
            try
            {
                imageCrypt::encryptSShift(&image_gray, offset, false);
            }
            catch (std::invalid_argument &exc)
            {
                std::cout << "ERROR: " << exc.what() << std::endl;
            }
            break;
        case '?':
            print_help();
            return 0;
        }
    }

    // Shows the result:
    cv::namedWindow("Image result", cv::WINDOW_AUTOSIZE);
    cv::imshow("Image result", image_gray);

    cv::waitKey(0);

    return 0;
}