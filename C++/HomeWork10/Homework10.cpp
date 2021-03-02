#include <iostream>

using namespace std;

void concatenateTwoArraysOfChars(char stringOne[], char stringTwo[], char concatenatedArray[]);

int main() {
    return 0;
}

void concatenateTwoArraysOfChars(char stringOne[], char stringTwo[], char concatenatedArray[]) {
    int ix;
    int sizeOfFirstString = 0;

    for (ix = 0; stringOne[ix] != '\0'; ix++) {
        concatenatedArray[ix] = stringOne[ix];
        sizeOfFirstString++;
    }
    for (ix = 0; stringTwo[ix] != '\0'; ix++) {
        concatenatedArray[ix + sizeOfFirstString] = stringTwo[ix];
    }
    concatenatedArray[ix + sizeOfFirstString] = '\0';
}

