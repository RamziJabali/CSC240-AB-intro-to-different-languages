#include <iostream>

using namespace std;

//UserInput
void optionOneRepresentative();

double optionTwoRepresentative();

void optionThreeRepresentative();

//Engineers for the computations
void optionOneEngineer();

void optionTwoEngineer();

void OptionThreeEngineer();

//Extra Required Function
void getXAndYCoordinates(double &xCoordinate, double &yCoordinate);

//My Functions
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
    cout << "Enter X Coordinates " << endl;
    cin >> xCoordinate;
    cout << "Enter Y Coordinates " << endl;
    cin >> yCoordinate;
}

void optionOneRepresentative() {
    cout << "I am at one\n";
    double x, y;
    getXAndYCoordinates(x, y);

}

double optionTwoRepresentative() {
    cout << "I am at two\n";
}

void optionThreeRepresentative() {
    cout << "I am at three\n";
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