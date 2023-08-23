#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
int main()
{
int seed,d1,d2,d3,d4;
cout<<"enter seed:";
cin>>seed;
srand(time(0));
d1=rand()%6+1;
cout<<d1<<"\n";
d2=rand()%6+1;
cout<<d2<<"\n";
d3=rand()%6+1;
cout<<d3<<"\n";
d4=rand()%6+1;
cout<<d4<<"\n";
if(d1+d2>d3+d4)
cout<<"p1 won";
else if(d1+d2<d3+d4)
cout<<"p2 won";
else
cout<<"equal";
return 0;
}
