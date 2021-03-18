#include <iostream>

using namespace std;

void mainMenu();

void getLine(char line[]);

void initializeLetterCounter(char text[], int letterCounter[]);

void countAndFrequencyOfLine(char text[], int letterCounter[]);

char getLowerCaseLetter(char upperCaseLetter);

int isItALetter(char character);

int getLetterCount(char text[]);

double getLetterFrequency(int letterCount, int numberOfLetters);

int doesUserWantToQuit();

void printEnterASentence();

void printDoYouWantToQuit();

int main() {
    mainMenu();
    return 0;
}

void mainMenu() {
    char text[81];
    int letterCounter[26];
    do {
        printEnterASentence();
        getLine(text);

        cout << "Your Text:\n" << text << endl;
        initializeLetterCounter(text, letterCounter);
        countAndFrequencyOfLine(text, letterCounter);
    } while (doesUserWantToQuit());
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

void countAndFrequencyOfLine(char text[], int letterCounter[]) {
    int displayCounter = 0;
    int numberOfLetters = getLetterCount(text);
    cout << "Letter    Count    Frequency\n";
    for (int i = 0; i < 26; i++) {
        if (displayCounter == 13) {
            cout << "Press Enter to continue display" << endl;
            cin.get();
            displayCounter = 0;
        }
        cout << getLowerCaseLetter(i + 'a') << "         " << letterCounter[i]
             << "         " << getLetterFrequency(letterCounter[i], numberOfLetters) << "%" << endl;
        displayCounter++;
    }
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

int isItALetter(char character) {
    return character >= 'A' && character <= 'Z' ||
           character >= 'a' && character <= 'z';
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

int getLetterCount(char text[]) {
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

double getLetterFrequency(int letterCount, int numberOfLetters) {
    return (letterCount * 100.0) / (numberOfLetters);
}

char getLowerCaseLetter(char upperCaseLetter) {
    if (upperCaseLetter >= 'a' && upperCaseLetter <= 'z') {
        return upperCaseLetter;
    }
    return 'a' - 'A' + upperCaseLetter;
}

void printEnterASentence() {
    cout << "Enter a sentence" << endl;
}

void printDoYouWantToQuit() {
    cout << "Do you want to Quit the application\n"
            "'y' to quit\n"
            "'n' to continue" << endl;
}