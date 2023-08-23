#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
int main()
{
  int back=0,front=0,face;
  srand(time(0));
  for (int i = 1; i<= 2000; i++ )
    {

      face=rand()%2+1;
      switch(face)
        {
          case 1:
            ++back;
            break;
          case 2:
            ++front;
            break;
          default:
        cout<<"Error!";
        }
    }
  cout<<"Front: "<< front<<endl;
  cout<<"Back : "<< back<<endl;
  return 0;
}
