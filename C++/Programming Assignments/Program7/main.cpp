#include <iostream>

using namespace std;

void getLine(char line[]);

void initializeLetterCounter(char line[], int letterCounter[]);

char getLowerCaseLetter(char upperCaseLetter);

int isItALetter(char character);

int main() {
    char line[81];
    cout << "Enter a sentence" << endl;
    int letterCounter[26];
    getLine(line);
    initializeLetterCounter(line, letterCounter);
    for (int i = 0; i < 26; i++) {
        cout << getLowerCaseLetter(i + 'a') << " " << letterCounter[i] << endl;
    }
    return 0;
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
    char letterInLowerCase = 'a' - 'A' + character;
    return letterInLowerCase < 'a' || letterInLowerCase > 'z';
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

char getLowerCaseLetter(char upperCaseLetter) {
    if (upperCaseLetter >= 'a' && upperCaseLetter <= 'z') {
        return upperCaseLetter;
    }
    return 'a' - 'A' + upperCaseLetter;
}
