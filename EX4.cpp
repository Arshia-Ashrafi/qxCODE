#include<iostream>
using namespace std;

int main()
{
    int i, j, f = 0;
    
    cout << "Enter the first number: ";
    cin >> i;
    cout << "Enter the second number: ";
    cin >> j;

    if (j < i) {
        for (f = j; f < i; f++)
        {
            if (f % 2 == 0)
                cout << f << endl;
        }
    } 
    else if (i < j) {
        for (f = i; f < j; f++)
        {
            if (f % 2 == 0)
                cout << f << endl;
        }
    } 

    return 0;
}
