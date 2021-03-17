//Author Ramzi Eljabali
//Homework 4
//Purpose: To learn about pointers and how to use them
//Date: 07/02/2021

#include <iostream>

using namespace std;

int main() {
    int bank;
    bank = 1;
    int *money;
    money = &bank;
    cout << "Value of var bank: " << bank << endl;
    cout << "Value of var money: " << *money << endl;
    cout << "Address of var bank: " << &bank << endl;
    cout << "Address of var money: " << &money << endl;
    return 0;
}
//Output for your interest:
//Value of var bank: 1
//Value of var money: 1
//Address of var bank: 0x7ffeef75a998
//Address of var money: 0x7ffeef75a990