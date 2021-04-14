#include <iostream>

using namespace std;

struct Dimensions {
    double diagonal;//y
    double aspectRatio;//a
    double height;
    double width;
};

Dimensions getDimensions();

Dimensions getDimensions() {

    Dimensions dimensions;

    cout << "Enter a number for the Aspect Ratio" << endl;
    cin >> dimensions.aspectRatio;

    cout << "Enter a number for the Diagonal" << endl;
    cin >> dimensions.diagonal;

    dimensions.height = sqrt(pow(dimensions.diagonal, 2) / (1 + pow(dimensions.aspectRatio, 2)));
    dimensions.width = dimensions.aspectRatio * dimensions.height;
    return dimensions;
}

int main() {
    Dimensions dimensions = getDimensions();
    cout << "Height: " << dimensions.height << endl;
    cout << "Width: " << dimensions.width << endl;
}

