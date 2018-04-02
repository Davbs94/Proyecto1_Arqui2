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
    std::cout << "   -v --rcshift offset            Performs Circular right shift encrypt with a given offset." << std::endl;
    std::cout << "   -c --lcshift offset            Performs Simple left shift encrypt with a given offset." << std::endl;
    std::cout << "   -s --psum                      Performs Simple positive sum encrypt with a given vector." << std::endl;
    std::cout << "   -n --nsum                      Performs Simple negative sum encrypt with a given vector." << std::endl;
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
        {"rcshift", required_argument, NULL, 'v'},
        {"lcshift", required_argument, NULL, 'c'},
        {"psum", no_argument, NULL, 's'},
        {"rsum", no_argument, NULL, 'n'},
        {"value1", required_argument, NULL, '1'},
        {"value2", required_argument, NULL, '2'},
        {"value3", required_argument, NULL, '3'},
        {"value4", required_argument, NULL, '4'},
        {NULL, 0, NULL, 0}};
    int value, key, offset;
    cv::Mat image, image_gray;
    int *sumVector = new int[4]; // Vector used to hold sum algoritm's values.
    bool *validationVector = new bool[4]; // Checks if said position of the sum algorithm's value has been set.
    for (int i = 0; i < 4; ++i)
    {
        validationVector[i] = false;
    }

    if (argc == 1) // If no arguments are passed, show the help dialog.
    {
        print_help();
        return -1;
    }

    // This while loop parses the given command line arguments and call the respective functions.
    while ((value = getopt_long(argc, argv, "f:x:r:l:c:v:n:1:2:3:4:s", longOptions, NULL)) != -1)
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
                std::cout << "Error opening file" << std::endl;
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
        case 'v':
            offset = std::stoi(optarg, NULL, 10);
            try
            {
                imageCrypt::encryptCShift(&image_gray, offset, true);
            }
            catch (std::invalid_argument &exc)
            {
                std::cout << "ERROR: " << exc.what() << std::endl;
            }
            break;
        case 'c':
            offset = std::stoi(optarg, NULL, 10);
            try
            {
                imageCrypt::encryptCShift(&image_gray, offset, true);
            }
            catch (std::invalid_argument &exc)
            {
                std::cout << "ERROR: " << exc.what() << std::endl;
            }
            break;
        case 's':
            for (int i = 0; i < 4; ++i) // Checking if all 4 values have been set.
            {
                if (!validationVector[i])
                {
                    std::cout << "ERROR: Sum algorithm requires all 4 numbers" << std::endl;
                    return 0;
                }
            }
            imageCrypt::encryptSum(&image_gray, sumVector, true);
            break;
        case 'n':
            for (int i = 0; i < 4; ++i) // Checking if all 4 values have been set.
            {
                if (!validationVector[i])
                {
                    std::cout << "ERROR: Sum algorithm requires all 4 numbers" << std::endl;
                    return 0;
                }
            }
            imageCrypt::encryptSum(&image_gray, sumVector, false);
            break;
        case '1':
            sumVector[0] = std::stoi(optarg, NULL, 10);
            validationVector[0] = true;
            break;
        case '2':
            sumVector[1] = std::stoi(optarg, NULL, 10);
            validationVector[1] = true;
            break;
        case '3':
            sumVector[2] = std::stoi(optarg, NULL, 10);
            validationVector[2] = true;
            break;
        case '4':
            sumVector[3] = std::stoi(optarg, NULL, 10);
            validationVector[3] = true;
            break;
        case '?':
            print_help();
            return 0;
        }
    }

    // Shows the result:
    cv::namedWindow("Image result", cv::WINDOW_AUTOSIZE);
    cv::imshow("Image result", image_gray); // Optional
    cv::imwrite("result.jpg", image_gray);

    cv::waitKey(0);
    delete sumVector;
    delete validationVector;

    return 0;
}