clc
clear

syms h
r=2;
L=5;
V=8;

f= (r^2*acos((r-h)/r)-(r-h)*sqrt(2*r*h-h^2))*L-V;
df=diff(f,h);

h0=r;
e=0.005;
E=1;
n=0;
while E>e
    n=n+1;
    fh=double(subs(f,h0));
    dfh=double(subs(df,h0));
    h1=h0-fh/dfh;
    E=abs(h1-h0);
    fprintf('n = %d \t h = %.4f \t e = %.4f \n',n,h1,E);
    h0=h1;
end