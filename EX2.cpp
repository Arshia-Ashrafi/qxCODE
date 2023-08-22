#include<iostream>
using namespace std;

int main()
{
    int n;
    cin >> n;
    int* array = new int[n];

    for (int f = 0; f < n; f++)
    {
        int i, j;
        cin >> i >> j;
        array[i] = i * j;
    }

    int m = 0;
    for (int f = 0; f < n; f++)
    {
        m += array[f];
    }

    cout << m / n << endl;

    delete[] array;
    return 0;
}
