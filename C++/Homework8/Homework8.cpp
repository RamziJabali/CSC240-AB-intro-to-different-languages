#include <iostream>

using namespace std;

int main() {
    char firstWord[81];
    char secondWord[81];
    char thirdWord[81];
    char fourthWord[81];
    cout << "Enter an adjective for madlibs" << endl;
    cin >> firstWord;

    cout << "Enter a verb for madlibs" << endl;
    cin >> secondWord;

    cout << "Enter a noun for madlibs" << endl;
    cin >> thirdWord;

    cout << "Enter a noun for madlibs" << endl;
    cin >> fourthWord;

    cout << "Your friend is " << firstWord << "! Stop " << secondWord <<
         " with the elephant" << endl;
    cout << " Go " << thirdWord << " and start running! Stop being a " << fourthWord <<
         "!";
    return 0;
}
