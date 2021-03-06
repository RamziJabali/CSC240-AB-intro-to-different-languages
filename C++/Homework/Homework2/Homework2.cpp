//@Author: Ramzi Eljabali, Date: 01/27/2021
//@Purpose: Asks user for the number of spheres
//they want to find the total volume for, then
//it asks for the radius of each sphere and
//finally displays the total volume of all spheres.

#include <iostream>
#include <math.h>

using namespace std;

int main() {
    const string HOW_MANY_SPHERES = "How many spheres would you like"
                                    " to get the total total Volume of for?";
    const string WARNING_ENTER_VALID_SPHERE_NUMBER =
            "Enter sphere number greater than or equal to 1 please.";
    const string WARNING_ENTER_VALID_RADIUS_VALUE =
            "Enter radius value greater than 0 please.";
    const string ENTER_RADIUS_VALUE = "Please Enter the value of the "
                                      "radius(inches) #";
    const string TOTAL_VOLUME = "Your total total Volume is: ";
    const string VOLUME_UNITS = " CUBIC INCHES";

    const double PI = 3.14159;
    const double FOUR_THIRDS = 4.0 / 3.0;

    double totalVolume = 0;
    double radius;

    double totalNumberOfSpheres;

    cout << HOW_MANY_SPHERES << endl;
    do {
        cin >> totalNumberOfSpheres;
        if (totalNumberOfSpheres < 1) {
            cout << WARNING_ENTER_VALID_SPHERE_NUMBER << endl;
        }
    } while (totalNumberOfSpheres < 1);

    for (int currentSphere = 1; currentSphere <= totalNumberOfSpheres; currentSphere++) {
        cout << ENTER_RADIUS_VALUE << currentSphere << endl;
        do {
            cin >> radius;
            if (radius <= 0) {
                cout << WARNING_ENTER_VALID_RADIUS_VALUE << endl;
            }
        } while (radius <= 0);
        totalVolume += FOUR_THIRDS * PI * pow(radius, 3);
        radius = 0;
    }
    cout << TOTAL_VOLUME << totalVolume << VOLUME_UNITS;
    return 0;
}
