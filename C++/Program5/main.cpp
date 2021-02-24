#include <iostream>
#include <math.h>

using namespace std;

//UserInput
void optionOneRepresentative();

double optionTwoRepresentative();

void optionThreeRepresentative();

//Engineers for the computations
void optionOneEngineer(double x1, double x2, double y1, double y2,
                       double *distance, double *horizontalAngle);

void optionTwoEngineer();

void OptionThreeEngineer();

//Extra Required Function
void getXAndYCoordinates(double &xCoordinate, double &yCoordinate);

//My Functions
double PI();

void printIntroductionDialogue();

void mainMenu();

int getUserMenuChoice();

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
    int power = 2;

    double dx = (x2 - x1); //Difference between X coordinates
    double dy = (y2 - y1); //Difference between Y coordinates
    double angleInRadians;

    *distance = sqrt(pow(dx, power) + pow(dy, power));

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

double optionTwoRepresentative() {
    
}

void optionThreeRepresentative() {
    cout << "I am at three\n";
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