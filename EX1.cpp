#include<iostream>
using namespace std;

int main()
{
    long int n;
    double p = 0.0;
    int x = 0;

    cout << "Enter n: ";
    cin >> n;

    for (int i = 1; i <= n; i += 2)
    {
        if (x == 0)
        {
            p += 1.0 / i;
            x = 1;
        }
        else if (x == 1)
        {
            p -= 1.0 / i;
            x = 0;
        }
    }

    cout << p << endl;
    return 0;
}
