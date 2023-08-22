#include<iostream>
using namespace std;

void insert(int a[], int& m, int k, int x);

int main()
{
    int m = 7, k, x;
    int a[] = {1, 4, 7, 10, 13, 16, 20};
    
    cout << "Enter a number and position: ";
    cin >> x >> k;
    
    insert(a, m, k, x);
    
    for(int i = 0; i <= m; i++)
        cout << a[i] << " ";
    
    return 0;
}

void insert(int a[], int& m, int k, int x)
{
    for(int i = m-1; i >= k; i--)
        a[i+1] = a[i];
    
    a[k] = x;
    m++;
}
