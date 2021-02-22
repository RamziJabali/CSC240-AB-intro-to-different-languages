#include <iostream>
using namespace std;
//ptr 8170
//one 8171
//list 8172-8173-8174


//8170 8171 8172 8173 8174
//ptr  one  list list list
//           [0]  [1]  [2]
int main( )
{
    int one; //8171
    int *ptr; //8170
    int list[3]; //8172-8173-8174
    list[0] = 77;//8172
    list[1] = 88;//8173
    list[2] = 99;//8174
    one = 1111;//8171<--|
    ptr = &one;//8170-->| 8171
    cout << one << endl; //output: 1111 Address: 8171
    cout << &one << endl;// Address 8171
    cout << list[2] << endl;// 99
    cout << *list << endl; // base Address: 8172 --> 77
    cout << &ptr << endl; // 8170
    cout << ptr << endl; //  8171
    cout << *ptr << endl; //1111 dereferences
    //Starts going wrong here
    cout << *(ptr + 2) << endl; //8171 + 2 = 8173 --> prints list[1] or 88 //After running it actually prints 77 not like in the class docs
    cout << *(ptr - 1) << endl; //8170 --> contents of 8170 is 8171 //gives 0 no clue why
    cout << *(++ptr) << endl; // ptr = 8171 + 1 = 8172  --> 77 // gives 0 no clue why
    cout << *(ptr + 1) << endl;// 8172 + 1= 8173 --> 88 // gives 77 which is not like the class document
    cout << *ptr + 1 << endl;// *8173 = 88 + 1 = 89 // gives you 1 no clue why, not like class document
    return 0;
}
/*
OUTPUT
1111
0x7ffee0eb8984
99
77
0x7ffee0eb8978
0x7ffee0eb8984
1111
77
0
0
77
1

Process finished with exit code 0
 */