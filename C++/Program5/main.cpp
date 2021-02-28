#include <iostream>
#include <math.h>
#include <stdlib.h>

using namespace std;


//Phase 1
void optionTwoRepresentative();

void optionThreeRepresentative();

//UserInput/output
void optionOnePhaseTwoMenu();

void optionOneInputOutput();

void optionTwoInputAndOutput();

void optionThreeInputOutput();

//Engineers for the computations
void optionOneEngineer(double x1, double x2, double y1, double y2,
                       double *distance, double *horizontalAngle);

double optionTwoEngineer(double elevationAngle, double velocity);

void optionThreeEngineer(double x1, double y1, double &x2, double &y2,
                         double horizontalAngle, double distance);

//Phase 2 extra required function

int getRandomNumber();

void optionThreeCheatMode();

//My Functions

void getXAndYCoordinates(double &xCoordinate, double &yCoordinate);

double getElevationAngle();

double getVelocity();

double getHorizontalAngle();

double getDistance();

double getUserVerticalAngleIncrement();

double getUserVelocityIncrement();

int doesUserWantCheatMode();

int doesUserWantToIncrementVelocityOrVerticalAngle();

void createAndDisplayArtilleryTable(double incrementAmount, double verticalAngle,
                                    double velocity, int velocityOrAngle);

double PI();

double gravitationalVelocity();

int getUserMenuChoice();

int getUserMenuChoicePhase1();

int feetPerMile();

int secondsPerHour();

int two();

void printIntroductionDialogue();

void printPhase1MenuDialogue();

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
                optionOnePhaseTwoMenu();
                break;
            case 2:
                optionTwoInputAndOutput();//
                break;
            case 3:
                optionThreeInputOutput();
                break;
            case 4:
                quit();
                break;
        }
    } while (userChoice != 4);
}

void optionOnePhaseTwoMenu() {
    int userChoice;
    do {
        userChoice = getUserMenuChoicePhase1();
        switch (userChoice) {
            case 1:
                optionOneInputOutput();
                break;
            case 2:
                optionTwoRepresentative();
                break;
            case 3:
                optionThreeRepresentative();
                break;
        }
    } while (userChoice != 4);
}

void optionOneInputOutput() {
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

void optionTwoRepresentative() {
    cout << "OPTION 2:" <<
         endl;
    double angleOfElevation = getElevationAngle();
    double velocity = getVelocity();
    cout << "Your horizontal distance is " <<
         optionTwoEngineer(angleOfElevation, velocity)
         << "Feet" << endl << endl;
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

void optionTwoInputAndOutput() {
    cout << "OPTION 2: Artillery Table" << endl;
    double angleOfElevation = getElevationAngle();
    double velocity = getVelocity();
    int velocityOrVerticalAngle = doesUserWantToIncrementVelocityOrVerticalAngle();
    if (velocityOrVerticalAngle == 1) {
        createAndDisplayArtilleryTable(getUserVelocityIncrement(),
                                       angleOfElevation, velocity, velocityOrVerticalAngle);
    } else {
        createAndDisplayArtilleryTable(getUserVerticalAngleIncrement(),
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

//TODO: EASY MODE 100 FOOT RADIUS
//TODO: MEDIUM MODE 25 FOOT RADIUS
//TODO: HARD MODE 5 FOOT RADIUS
//TODO: MAKE RANDOM NUMBER GENERATOR 0 - 5000(DONE)
//TODO
//
void optionThreeInputOutput() {
    cout << "OPTION 3: TARGET PRACTICE" << endl;
    double x1, y1, x2, y2;
    double horizontalAngle = getHorizontalAngle();//make a separate function for getting
    // the horizontal angle 0 -> 180
    double distance = getDistance();
    x1 = 2500;
    y1 = 0;
    x2 = getRandomNumber();
    y2 = getRandomNumber();
    //TODO:ask the user to enter the direction of the barrel (horizontal angle: 0 to 180 degrees)
    //TODO:ask the user to enter the elevation of the barrel (vertical angle: 0 to 90 degrees)
    //TODO:ask the user to enter the the velocity (mph).
    if (doesUserWantCheatMode()) {

    } else {

    }

}


void optionThreeEngineer(double x1, double y1, double &x2, double &y2,
                         double horizontalAngle, double distance) {
    double horizontalAngleInRads = horizontalAngle * PI() / 180;
    double dx = distance * cos(horizontalAngleInRads);
    double dy = distance * sin(horizontalAngleInRads);
    x2 = x1 + dx;
    y2 = y1 + dy;
}

int doesUserWantCheatMode() {
    int userChoice;
    do {
        cout << "Do you want to play in cheat mode?"
                "(1) Yes\n"
                "(2) No" << endl;
        cin >> userChoice;
    } while (userChoice != 1 && userChoice != 2);
    return userChoice;
}


int getRandomNumber() {
    return rand() % 5001;
}

void getXAndYCoordinates(double &xCoordinate, double &yCoordinate) {
    cout << "Enter X Coordinates in Feet " << endl;
    cin >> xCoordinate;
    cout << "Enter Y Coordinates in Feet " << endl;
    cin >> yCoordinate;
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

void createAndDisplayArtilleryTable(double incrementAmount, double verticalAngle,
                                    double velocity, int velocityOrAngle) {
    int rowAmount;

    do {
        cout << "How many rows would you like to see\n"
                "If you want only 1 row, type \"1\"\n"
                "For more, type your desired number of rows" << endl;
        cin >> rowAmount;
    } while (rowAmount < 0);

    if (velocityOrAngle == 1) {
        cout << "Velocity       Distance" << endl;
        cout << "(feet)         (feet)" << endl;
        if (rowAmount == 0) {

        }
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
    cout << "\n" << endl;
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
                "\nbetween 0° to 180° INCLUSIVE:" << endl;
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

int getUserMenuChoicePhase1() {
    int userMenuChoice;

    do {
        printPhase1MenuDialogue();
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
            "(1) Gives you a menu with 3 options that run basic calculations.\n"
            "(2) Generates a table of distances that a shot will travel\n"
            "when fired from a cannon.\n"
            "(3) Target practice: Lets you fire shots at a randomly assigned\n"
            "target location. With three different modes:\n"
            "EASY, MEDIUM, and HARD\n"
            "And a special cheat mode\n"
            "(4) quit\n"
            "Enter a number 1 -> 4 inclusive\n";
}

void printPhase1MenuDialogue() {
    cout << "Pick One of the four options:\n"
            "(1) Given two points, we'll compute the distance between the two points,\n"
            "and the horizontal angle from the first point to the second.\n"
            "(2) Given the elevation angle and velocity,\n"
            "we'll compute the (horizontal) distance an object travels.\n"
            "(3) Given a starting point, a distance, and a horizontal angle,\n"
            "we'll compute the destination point.\n"
            "(4) Go back to the main Application\n"
            "Enter a number 1 -> 4 inclusive\n";
}

void quit() {
    cout << "\nThank you for using the Application";
}