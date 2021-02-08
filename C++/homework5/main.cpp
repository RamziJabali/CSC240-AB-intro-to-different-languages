#include <iostream>
#include <math.h>

using namespace std;

double computeVolume(double radius, double crossSection);

void getUserInputForRadiusAndCrossSection(double *radius, double *crossSection);

void printIntroduction();

void printVolume(double volume);

int main() {
    double radius, crossSection;
    printIntroduction();
    getUserInputForRadiusAndCrossSection(&radius, &crossSection);
    printVolume(computeVolume(radius, crossSection));
    return 0;
}

double computeVolume(double radius, double crossSection) {
    const double PI = 3.14159;
    return 2 * pow(PI, 2) * radius * crossSection;
}

void printVolume(double volume) {
    cout << "Ring Volume(Cubic Inches): " << volume << endl;
}

void getUserInputForRadiusAndCrossSection(double *radius, double *crossSection) {
    do {
        cout << "Please enter a POSITIVE radius(inches)" << endl;
        cin >> *radius;
    } while (*radius < 0);

    do {
        cout << "Please enter a POSITIVE CrossSection(inches)" << endl;
        cin >> *crossSection;
    } while (*crossSection < 0);
}

void printIntroduction() {
    cout << "Compute Ring Volume" << endl;
}