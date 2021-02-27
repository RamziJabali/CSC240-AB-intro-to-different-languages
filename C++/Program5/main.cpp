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

void optionThreeEngineer(double x1, double y1, double &x2, double &y2,
                         double horizontalAngle, double distance);

//Extra Required Function
void getXAndYCoordinates(double &xCoordinate, double &yCoordinate);

//My Functions
double getElevationAngle();

double getVelocity();

double getHorizontalAngle();

double getDistance();

double getUserVerticalAngleIncrement();

double getUserVelocityIncrement();

int doesUserWantToIncrementVelocityOrVerticalAngle();

void createAndDisplayTable(double incrementAmount, double verticalAngle,
                           double velocity, int velocityOrAngle);//TODO: Figure out the parameter list

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
                optionOneRepresentative();//stays the same
                break;
            case 2:
                optionTwoRepresentative();//
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
    cout << "OPTION 1:" << endl;
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
//TODO: Ask for initial values of vertical angle and velocity (DONE)
//TODO: Make function to accept the increment increase(DONE)
//TODO: Ask how many rows they want in the table(DONE)
//TODO: Ask by how much they want to increase by for each of the rows(DONE)
//TODO: Make a function to print the table(DONE)
//TODO: Make a function to choose the desired increment variable for the table(DONE)

void optionTwoRepresentative() {
    cout << "OPTION 2:" << endl;
    double angleOfElevation = getElevationAngle();
    double velocity = getVelocity();
    int velocityOrVerticalAngle = doesUserWantToIncrementVelocityOrVerticalAngle();
    if (velocityOrVerticalAngle == 1) {
        createAndDisplayTable(getUserVelocityIncrement(),
                              angleOfElevation, velocity, velocityOrVerticalAngle);
    } else {
        createAndDisplayTable(getUserVerticalAngleIncrement(),
                              angleOfElevation, velocity, velocityOrVerticalAngle);
    }
}

double optionTwoEngineer(double elevationAngle, double velocity) {
    double elevationAngleInRads = elevationAngle * (PI() / 180);
    double initialVelocity = velocity * feetPerMile() / secondsPerHour();
    return pow(initialVelocity, two()) * sin(two() *
                                             elevationAngleInRads) /
           gravitationalVelocity();
}

void optionThreeRepresentative() {
    cout << "OPTION 3:" << endl;
    double x1, y1, x2, y2;
    double horizontalAngle = getHorizontalAngle();
    double distance = getDistance();
    getXAndYCoordinates(x1, y1);
    optionThreeEngineer(x1, y1, x2, y2, horizontalAngle, distance);
    cout << "Given starting point (" << x1 << "," << y1 << ")" << endl;
    cout << "and given horizontal angle " << horizontalAngle << "° " << endl
         << "and given distance " << distance << " feet" << endl
         << "we get destination point (" << x2 << "," << y2 << ")"
         << endl << endl;
}

void optionThreeEngineer(double x1, double y1, double &x2, double &y2,
                         double horizontalAngle, double distance) {
    double horizontalAngleInRads = horizontalAngle * PI() / 180;
    double dx = distance * cos(horizontalAngleInRads);
    double dy = distance * sin(horizontalAngleInRads);
    x2 = x1 + dx;
    y2 = y1 + dy;
}

int doesUserWantToIncrementVelocityOrVerticalAngle() {
    int userInput;
    do {
        cout << "Would you like to increment \n"
                "(1) For the Velocity \n"
                "(2) For the Vertical angle \n" << endl;
        cin >> userInput;
    } while (userInput != 1 && userInput != 2);
    return userInput;
}

double getUserVerticalAngleIncrement() {
    double incrementAmount;
    do {
        cout << "Please Enter a number in degrees you want to increment the\n"
                "vertical angle by:" << endl;
        cin >> incrementAmount;
    } while (incrementAmount <= 0);
    return incrementAmount;
}

double getUserVelocityIncrement() {
    double incrementAmount;
    do {
        cout << "Please Enter a number in FEET you want to increment the\n"
                "velocity by:" << endl;
        cin >> incrementAmount;
    } while (incrementAmount <= 0);
    return incrementAmount;
}

void createAndDisplayTable(double incrementAmount, double verticalAngle,
                           double velocity, int velocityOrAngle) {
    int rowAmount;

    do {
        cout << "How many rows would you like to see\n"
                "If you want only 1 row, type \"0\"\n"
                "For more, type your desired number of rows" << endl;
        cin >> rowAmount;
    } while (rowAmount < 0);

    if (velocityOrAngle == 1) {
        cout << "Velocity       Distance" << endl;
        cout << "(feet)         (feet)" << endl;
    } else {
        cout << "Angle       Distance" << endl;
        cout << "(degs)      (feet)" << endl;
    }

    for (int i = 0; i < rowAmount; ++i) {
        if (velocityOrAngle == 1) {
            cout << velocity << "            " <<
                 optionTwoEngineer(verticalAngle, velocity) << endl;
            velocity += incrementAmount;
        } else {
            cout << verticalAngle << "          " <<
                 optionTwoEngineer(verticalAngle, velocity) << endl;
            verticalAngle += incrementAmount;
        }
    }
}

double getDistance() {
    double distance;
    do {
        cout << "Enter a distance in FEET GREATER than 0 NOT INCLUSIVE:" << endl;
        cin >> distance;
    } while (distance <= 0);
    return distance;
}

double getHorizontalAngle() {
    double horizontalAngle;
    do {
        cout << "Enter a horizontal angle IN DEGREES(°) "
                "\nbetween 0° to 360° INCLUSIVE:" << endl;
        cin >> horizontalAngle;
    } while (horizontalAngle < 0 || horizontalAngle > 360);
    return horizontalAngle;
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