clc
clear

d=3;
R=1.5;
C=0.6;
g=9.81;

f=@(t,H) (pi*d^2/4)*C*sqrt(2*g*H)/(2*H*((3*R-H)/3-H^2/3));
t=0;
H=2.8;
h=1;
n=200;

for i=1:n
    H(:,i+1)=H(:,i)+h*f(t(i),H(:,i));
    t(i+1)=t(i)+h;
end
disp('euler method : ')
fprintf( H );
