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
    const string ENTER_RADIUS_VALUE = "Please Enter the value of the radius #";
    const string TOTAL_VOLUME = "Your total total Volume is: ";
    const string VOLUME_UNITS = " CUBIC INCHES";

    const double PI = 3.14159;
    const double FOUR_THIRDS = 4.0 / 3.0;

    double totalVolume = 0;
    double radius = 0;

    double totalNumberOfSpheres = 0;

    cout << HOW_MANY_SPHERES << endl;

    while (totalNumberOfSpheres < 1) {
        cin >> totalNumberOfSpheres;
        if (totalNumberOfSpheres < 1) {
            cout << WARNING_ENTER_VALID_SPHERE_NUMBER << endl;
        }
    }

    for (int currentSphere = 1; currentSphere <= totalNumberOfSpheres; currentSphere++) {
        cout << ENTER_RADIUS_VALUE << currentSphere << endl;
        while (radius <= 0) {
            cin >> radius;
            if (radius <= 0) {
                cout << WARNING_ENTER_VALID_RADIUS_VALUE << endl;
            }
        }
        totalVolume += FOUR_THIRDS * PI * pow(radius, 3);
        radius = 0;
    }
    cout << TOTAL_VOLUME << totalVolume << VOLUME_UNITS;
    return 0;
}
