//Author: RAMZI ELJABALI
//Date: 01/17/2021
//Purpose: To Get text from user, see each letter's count &
//to then display a table with the frequency of each letter

#include <iostream>

using namespace std;

int doesUserWantToQuit();

int isItALetter(char character);

int getTotalLetterCount(char *text);

int FIVE_HUNDRED_ONE();

int TWENTY_SIX();

double getLetterFrequency(int letterCount, int numberOfLetters);

char getLowerCaseLetter(char upperCaseLetter);

void mainMenu();

void initializeLetterCounter(char text[], int letterCounter[]);

void letterCountAndFrequencyInText(char text[], int letterCounter[]);

void getLine(char line[]);

void printTable(char currentLetter, int letterCount, double letterFrequency);

void printTableHeader();

void printEnterASentence();

void printDoYouWantToQuit();

void printPressEnterToContinue();

void printTerminatingApp();

int main() {
    mainMenu();
    return 0;
}

int doesUserWantToQuit() {
    char userChoice[81];
    do {
        printDoYouWantToQuit();
        cin >> userChoice;
    } while (!isItALetter(userChoice[0])
             || (getLowerCaseLetter(userChoice[0]) != 'y'
                 && getLowerCaseLetter(userChoice[0]) != 'n'));
    return userChoice[0] == 'n' || userChoice[0] == 'N';
}

int isItALetter(char character) {
    return character >= 'A' && character <= 'Z' ||
           character >= 'a' && character <= 'z';
}

int getTotalLetterCount(char *text) {
    int letterCount = 0;
    int index = 0;
    do {
        if (isItALetter(text[index])) {
            letterCount++;
        }
        index++;
    } while (text[index] != '\0');
    return letterCount;
}

int FIVE_HUNDRED_ONE() {
    return 501;
}

int TWENTY_SIX() {
    return 26;
}

double getLetterFrequency(int letterCount, int numberOfLetters) {
    return (letterCount * 100.0) / (numberOfLetters);
}

char getLowerCaseLetter(char upperCaseLetter) {
    if (upperCaseLetter >= 'a' && upperCaseLetter <= 'z') {
        return upperCaseLetter;
    }
    return 'a' - 'A' + upperCaseLetter;
}

void mainMenu() {
    char text[FIVE_HUNDRED_ONE()];
    int letterCounter[TWENTY_SIX()];
    do {
        printEnterASentence();
        getLine(text);
        cout << text << endl;
        initializeLetterCounter(text, letterCounter);
        letterCountAndFrequencyInText(text, letterCounter);
    } while (doesUserWantToQuit());
    printTerminatingApp();
}

void initializeLetterCounter(char text[], int letterCounter[]) {
    int i;
    for (i = 0; i < 26; i++) {
        letterCounter[i] = 0;
    }
    i = 0;
    do {
        if (isItALetter(text[i])) {
            letterCounter[getLowerCaseLetter(text[i]) - 'a']++;
        }
        i++;
    } while (text[i] != '\0');
}

void letterCountAndFrequencyInText(char text[], int letterCounter[]) {
    int displayCounter = 0;
    int numberOfLetters = getTotalLetterCount(text);
    printTableHeader();
    for (int i = 0; i < 26; i++) {
        printTable(getLowerCaseLetter(i + 'a'), letterCounter[i],
                   getLetterFrequency(letterCounter[i], numberOfLetters));
        if (displayCounter == 13) {
            printPressEnterToContinue();
            cin.get();
            displayCounter = 1;
        }
        displayCounter++;
    }
}

void getLine(char line[]) {
    int i = 0;
    char c;

    while ((c = cin.get()) == '\n');

    do {
        line[i] = c;
        i++;
        c = cin.get();
    } while (c != '\n');
    line[i] = '\0';
}

void printTable(char currentLetter, int letterCount, double letterFrequency) {
    printf("%-12c%-12d%-12.2f\n", currentLetter, letterCount, letterFrequency);

}

void printTableHeader() {
    printf("%-12s%-12s%-12s\n", "Letter", "Count", "Frequency");
}

void printEnterASentence() {
    cout << "Enter a sentence" << endl;
}

void printDoYouWantToQuit() {
    cout << "Do you want to Quit the application\n"
            "'y' to quit\n"
            "'n' to continue" << endl;
}

void printPressEnterToContinue() {
    cout << "Press Enter to continue display" << endl;
}

void printTerminatingApp() {
    cout << "Terminating Program..." << endl;
}