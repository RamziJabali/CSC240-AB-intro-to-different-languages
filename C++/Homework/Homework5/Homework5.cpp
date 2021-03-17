//Author: Ramzi Eljabali
//Program: Homework5
//Purpose: Write FOUR subprograms to do the following
//a) Display an introduction: "Compute Ring Volume".
// (b) Ask the user to enter ring radius and cross section radius (both in inches),
// and make sure each input is positive.
// (Communicate both inputs to the main program using reference parameters.)
// (c) Given ring radius and cross section radius (input parameters to the subprogram)
//, compute the volume.  (Communicate the result using the return statement.)
//(d) Given the volume (an input parameter to the subprogram), display it with an
// appropriatelabel, including the units.
//Date 02/16/2021
#include <iostream>
#include <math.h>

using namespace std;

double computeVolume(double radius, double crossSection);

void getUserInputForRadiusAndCrossSection(double & radius, double & crossSection);

void printIntroduction();

void printVolume(double volume);

int main() {
    double radius, crossSection;
    printIntroduction();
    getUserInputForRadiusAndCrossSection(radius,crossSection);
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

void getUserInputForRadiusAndCrossSection(double &radius, double &crossSection) {
    do {
        cout << "Please enter a POSITIVE radius(inches)" << endl;
        cin >> radius;
    } while (radius <= 0);
    do {
        cout << "Please enter a POSITIVE CrossSection(inches)" << endl;
        cin >> crossSection;
    } while (crossSection <= 0);
}

void printIntroduction() {
    cout << "Compute Ring Volume" << endl;
}
