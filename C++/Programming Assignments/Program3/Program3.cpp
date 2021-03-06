//Author: Ramzi Eljabali
//Name: Program 3
//Purpose: predicts population growth of a pig farm
//given carrying capacity, initial population, birth rate,
//and death rate.
//date: 02/02/2021
#include <iostream>
#include <math.h>

using namespace std;

int getUserInputInt();

double getUserInputDouble();

char getUserInputChar();

char checkUserInputChar(char data, int partOfProgram);

int checkUserInputInt(int data, int partOfProgram);

int getTotalNumberOfPigs(int pigCapacity, int initialPopulation, int timeline,
                         char doesUserWantTable, double growthRate);

int checkUserInputDouble(double data);

void printIntroductionToApplication();

void printEnterPigCapacity();

void printEnterInitialPopulation();

void printEnterPigBirthRate();

void printEnterPigDeathRate();

void printEnterTimeLine();

void printWouldYouLikeATable();

void printWouldYouLikeToAnswerTheQuestionsAgain();

void printWouldYouLikeToStartANewFarm();

void printGoodBye();

void applicationMenu();

int main() {
    printIntroductionToApplication();
    applicationMenu();
    printGoodBye();
    return 0;
}

void applicationMenu() {
    int partOfProgram = 0;
    int pigCapacity, initialPopulation, timeline;
    char restart, doesUserWantTable;
    double deathRate, birthRate;

    do {
        switch (partOfProgram) {
            case 0:
                printEnterPigCapacity();
                pigCapacity = getUserInputInt();
                if (checkUserInputInt(pigCapacity, partOfProgram) == 1) {
                    partOfProgram++;
                } else {
                    partOfProgram = 0;
                }
                break;
            case 1:
                printEnterInitialPopulation();
                initialPopulation = getUserInputInt();
                if (checkUserInputInt(initialPopulation, partOfProgram) == 1) {
                    partOfProgram++;
                } else {
                    partOfProgram = 1;
                }
                break;
            case 2:
                printEnterPigBirthRate();
                birthRate = getUserInputDouble();
                if (checkUserInputDouble(birthRate) == 1) {
                    partOfProgram++;
                } else {
                    partOfProgram = 2;
                }
                break;
            case 3:
                printEnterPigDeathRate();
                deathRate = getUserInputDouble();
                if (checkUserInputDouble(deathRate) == 1) {
                    partOfProgram++;
                } else {
                    partOfProgram = 3;
                }
                break;
            case 4:
                printEnterTimeLine();
                timeline = getUserInputInt();
                if (checkUserInputInt(timeline, partOfProgram) == 1) {
                    partOfProgram++;
                } else {
                    partOfProgram = 4;
                }
                break;
            case 5:
                printWouldYouLikeATable();
                doesUserWantTable = getUserInputChar();
                if (checkUserInputChar(doesUserWantTable, partOfProgram) == 1) {
                    if (doesUserWantTable == 'y') {
                        getTotalNumberOfPigs(pigCapacity, initialPopulation,
                                             timeline, doesUserWantTable, birthRate - deathRate);
                    } else {
                        cout << "Total number of pigs after " << timeline << " months "
                                                                             "\n"
                                                                             "is " <<
                             getTotalNumberOfPigs(pigCapacity, initialPopulation,
                                                  timeline, doesUserWantTable, birthRate - deathRate)
                             << endl;
                    }
                    partOfProgram++;
                }
                break;
            case 6:
                printWouldYouLikeToAnswerTheQuestionsAgain();
                restart = getUserInputChar();
                if (checkUserInputChar(restart, partOfProgram) == 1) {
                    if (restart == 'y') {
                        partOfProgram = 1;
                    } else {
                        partOfProgram = 7;
                    }
                }
                break;
            case 7:
                printWouldYouLikeToStartANewFarm();
                restart = getUserInputChar();
                if (checkUserInputChar(restart, partOfProgram) == 1) {
                    if (restart == 'y') {
                        partOfProgram = 0;
                    } else {
                        partOfProgram = 8;
                    }
                }
        }
    } while (partOfProgram < 8);
}

int getTotalNumberOfPigs(int pigCapacity, int initialPopulation, int timeline,
                         char doesUserWantTable, double growthRate) {
    if (doesUserWantTable == 'y') {
        cout << "Month      Population" << endl;
    }
    int forPrinting;
    double bOld, bNew, pNew;
    double pOld = initialPopulation;
    for (int time = 0; time <= timeline; time++) {
        if (doesUserWantTable == 'y') {
            forPrinting = pOld;
            printf("%-11d%d\n", time, forPrinting);
        }
        if (time != timeline) {
            bOld = pOld / pigCapacity;
            bNew = bOld + growthRate * bOld * (1 - bOld);
            pNew = round(bNew * pigCapacity);
            pOld = pNew;
        }
    }
    return pNew;
}

char checkUserInputChar(char data, int partOfProgram) {
    switch (partOfProgram) {
        case 5:
        case 6:
        case 7:
            if (data != 'y' && data != 'n') {
                return 0;
            }
            return 1;
    }
}

int checkUserInputInt(int data, int partOfProgram) {
    switch (partOfProgram) {
        case 0:
        case 1:
            if (data < 1) {
                return 0;
            }
            break;
        case 4:
            if (data <= 0) {
                return 0;
            }
            break;
        case 5:
            if (data != 1 && data != 0) {
                return 0;
            }
            break;
    }
    return 1;
}

int checkUserInputDouble(double data) {
    if (data < 0 || data > 1) {
        return 0;
    }
    return 1;
}

char getUserInputChar() {
    char choice;
    cin >> choice;
    return choice;
}

int getUserInputInt() {
    int data;
    cin >> data;
    return data;
}

double getUserInputDouble() {
    double data;
    cin >> data;
    return data / 100;
}

void printIntroductionToApplication() {
    cout << "Welcome This Application will ask you several questions\n"
            "to predict your pig farms population growth over\n"
            "a specified amount of time!\n" << endl;
}

void printEnterPigCapacity() {
    cout << "Please Enter the number of pigs your\n"
            "farm can support(ONLY WHOLE NUMBERS).\n" << endl;
}

void printEnterInitialPopulation() {
    cout << "Please Enter the initial population of\n"
            "your farm(ONLY WHOLE NUMBERS).\n" << endl;
}

void printEnterPigBirthRate() {
    cout << "Please Enter your farms pig birth rate\n"
            "from 0% - 100% " << "(0) (93) (100)\n" << endl;
}

void printEnterPigDeathRate() {
    cout << "Please Enter your farms pig death rate\n"
            "from 0% - 100% Ex:" << "(0) (93) (100)\n" << endl;
}

void printEnterTimeLine() {
    cout << "Please Enter the time span in months.\n" << endl;
}

void printWouldYouLikeATable() {
    cout << "Would you Like a Table or just the answer?\n"
            "Enter ('y' for TABLE) ('n' for ANSWER)" << endl;
}

void printWouldYouLikeToAnswerTheQuestionsAgain() {
    cout << "Would you Like to answer the Questions again\n"
            "Except this time with the same carrying Capacity?\n"
            "Enter (y for Yes) (n to Continue)" << endl;
}

void printWouldYouLikeToStartANewFarm() {
    cout << "Would you Like to start A new Farm\n"
            "Enter (y to RESTART) (n to EXIT)" << endl;
}

void printGoodBye() {
    cout << "Application Terminating....." << endl;
}