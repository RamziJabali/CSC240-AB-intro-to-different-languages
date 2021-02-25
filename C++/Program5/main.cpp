#include <iostream>
#include <math.h>

using namespace std;

//UserInput
void optionOneRepresentative();

void optionTwoRepresentative();

void optionThreeRepresentative();

//Engineers for the computations
void optionOneEngineer(double x1, double x2, double y1, double y2,
                       double *distance, double *horizontalAngle);

double optionTwoEngineer(double elevationAngle, double velocity);

void OptionThreeEngineer();

//Extra Required Function
void getXAndYCoordinates(double &xCoordinate, double &yCoordinate);

//My Functions
double getElevationAngle();

double getVelocity();

double PI();

double gravitationalVelocity();

int getUserMenuChoice();

int feetPerMile();

int secondsPerHour();

int two();

void printIntroductionDialogue();

void mainMenu();

void quit();

int main() {
    mainMenu();
    return 0;
}

void mainMenu() {
    int userChoice;
    do {
        userChoice = getUserMenuChoice();
        switch (userChoice) {
            case 1:
                optionOneRepresentative();
                break;
            case 2:
                optionTwoRepresentative();
                break;
            case 3:
                optionThreeRepresentative();
                break;
            case 4:
                quit();
                break;
        }
    } while (userChoice != 4);
}


void getXAndYCoordinates(double &xCoordinate, double &yCoordinate) {
    cout << "Enter X Coordinates in Feet " << endl;
    cin >> xCoordinate;
    cout << "Enter Y Coordinates in Feet " << endl;
    cin >> yCoordinate;
}

void optionOneRepresentative() {
    double x1, y1, x2, y2;
    double distance = 0;
    double horizontalAngle = 0;
    getXAndYCoordinates(x1, y1);//first point
    getXAndYCoordinates(x2, y2);//second point
    optionOneEngineer(x1, x2, y1, y2, &distance, &horizontalAngle);

    cout << "Distance between point (" << x1 << "," << y1 << ") and " <<
         "point (" << x2 << "," << y2 << "): " << distance << " Feet" << endl;

    cout << "Horizontal Angle in Degrees from point (" << x1 << "," << y1 << ") to " <<
         "point (" << x2 << "," << y2 << "): " << horizontalAngle << "°" << endl << endl;
}

void optionOneEngineer(double x1, double x2, double y1, double y2,
                       double *distance, double *horizontalAngle) {
    double dx = (x2 - x1); //Difference between X coordinates
    double dy = (y2 - y1); //Difference between Y coordinates
    double angleInRadians;

    *distance = sqrt(pow(dx, two()) + pow(dy, two()));

    if (dx > 0) {
        angleInRadians = atan(dy / dx);
    } else if (dx < 0) {
        angleInRadians = atan(dy / dx) + PI();
    } else if (dx == 0 && dy >= 0) {
        angleInRadians = PI() / 2;
    } else {
        angleInRadians = -PI() / 2;
    }
    *horizontalAngle = angleInRadians * (180 / PI());
}

void optionTwoRepresentative() {
    cout << "Your horizontal distance is " <<
         optionTwoEngineer(getElevationAngle(), getVelocity()) << "Feet"
         << endl << endl;
}

double optionTwoEngineer(double elevationAngle, double velocity) {
    double elevationAngleInRads = elevationAngle * (PI() / 180);
    double initialVelocity = velocity * feetPerMile() / secondsPerHour();
    return pow(initialVelocity, two()) * sin(two() *
                                             elevationAngleInRads) /
           gravitationalVelocity();
}

void optionThreeRepresentative() {
    cout << "I am at three\n";
}

double getVelocity() {
    double velocity;
    do {
        cout << "Enter a velocity in MPH GREATER than 0 NOT INCLUSIVE:" << endl;
        cin >> velocity;
    } while (velocity <= 0);
    return velocity;
}

double getElevationAngle() {
    double angleOfElevation;
    do {
        cout << "Enter an elevation angle IN DEGREES(°) "
                "\nbetween 0° to 90° NOT inclusive:" << endl;
        cin >> angleOfElevation;
    } while (angleOfElevation <= 0 || angleOfElevation >= 90);
    return angleOfElevation;
}

double gravitationalVelocity() {
    return 32.172;
}

double PI() {
    return 3.14159265359;
}

int getUserMenuChoice() {
    int userMenuChoice;

    do {
        printIntroductionDialogue();
        cin >> userMenuChoice;
    } while (userMenuChoice < 1 || userMenuChoice > 4);
    return userMenuChoice;
}

int feetPerMile() {
    return 5280;
}

int secondsPerHour() {
    return 3600;
}

int two() {
    return 2;
}

void printIntroductionDialogue() {
    cout << "Pick One of the four options:\n"
            "(1) Given two points, we'll compute the distance between the two points,\n"
            "and the horizontal angle from the first point to the second.\n"
            "(2) Given the elevation angle and velocity,\n"
            "we'll compute the (horizontal) distance an object travels.\n"
            "(3) Given a starting point, a distance, and a horizontal angle,\n"
            "we'll compute the destination point.\n"
            "(4) Quit Application\n"
            "Enter a number 1 -> 4 inclusive\n";
}

void quit() {
    cout << "\nThank you for using the Application";
}