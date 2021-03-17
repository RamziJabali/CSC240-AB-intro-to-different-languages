#include <iostream>

using namespace std;

void getLine(char line[]);

void initializeLetterCounter(char line[], int letterCounter[]);

void countAndFrequencyOfLine(char line[], int letterCounter[]);

char getLowerCaseLetter(char upperCaseLetter);

int isItALetter(char character);

int getLetterCount(char line[]);

double getLetterFrequency(int letterCount, int numberOfLetters);

int main() {

    char line[81];
    cout << "Enter a sentence" << endl;
    int letterCounter[26];
    getLine(line);
    initializeLetterCounter(line, letterCounter);
    countAndFrequencyOfLine(line, letterCounter);
    return 0;
}

void countAndFrequencyOfLine(char line[], int letterCounter[]) {
    int displayCounter = 0;
    int numberOfLetters = getLetterCount(line);
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

void initializeLetterCounter(char line[], int letterCounter[]) {
    int i;
    for (i = 0; i < 26; i++) {
        letterCounter[i] = 0;
    }
    i = 0;
    do {
        if (isItALetter(line[i])) {
            letterCounter[getLowerCaseLetter(line[i]) - 'a']++;
        }
        i++;
    } while (line[i] != '\0');
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

int getLetterCount(char line[]) {
    int letterCount = 0;
    int index = 0;
    do {
        if (isItALetter(line[index])) {
            letterCount++;
        }
        index++;
    } while (line[index] != '\0');
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
