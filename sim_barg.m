clc
clear

syms x
W=10;
y0=5;
TH=126.6;
xmin=-50;
xmax=100;

F=(TH/W)*cosh(W*x/TH)+y0-(TH/W);
I=int(F,-50,100);
fprintf('real value is : %.0f\n',I);
%%
f=@(x) (TH/W)*cosh(W*x/TH)+y0-(TH/W);

dx=0.25;
x=xmin:dx:xmax;
S=0;
for i=1:length(x)
    if i==1 || i==length(x)
        S=S+f(x(i));
    else
        S=S+2*f(x(i));
    end
end
T=dx*S/2;
fprintf('for dx = %g \t answer is : %.0f \t error is : %d\n',dx,T,abs(T-I));


dx=0.5;
x=xmin:dx:xmax;
S=0;
for i=1:length(x)
    if i==1 || i==length(x)
        S=S+f(x(i));
    else
        S=S+2*f(x(i));
    end
end
T=dx*S/2;
fprintf('for dx = %g \t answer is : %.0f \t error is : %d\n',dx,T,abs(T-I));


dx=1;
x=xmin:dx:xmax;
S=0;
for i=1:length(x)
    if i==1 || i==length(x)
        S=S+f(x(i));
    else
        S=S+2*f(x(i));
    end
end
T=dx*S/2;
fprintf('for dx = %g  \t answer is : %.0f \t error is : %d\n',dx,T,abs(T-I));

dx=2;
x=xmin:dx:xmax;
S=0;
for i=1:length(x)
    if i==1 || i==length(x)
        S=S+f(x(i));
    else
        S=S+2*f(x(i));
    end
end
T=dx*S/2;
fprintf('for dx = %g  \t answer is : %.0f \t error is : %d\n',dx,T,abs(T-I));