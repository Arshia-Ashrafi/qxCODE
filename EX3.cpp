#include<iostream>
using namespace std;

int main()
{
    double x, p = 1.0;
    int y;

    cout << "Enter x: ";
    cin >> x;
    cout << "Enter y: ";
    cin >> y;

    for (int i = 1; i <= y; i++)
    {
        p *= x;
    }

    cout << "x^y: " << p << endl;

    return 0;
}
