clc
clear
a=input('a=')
E=200*10^9;
w=36*10^3;

L=2.4;
I=49.1*10^-6;
deltax=0.1;
    RA=w*L-2*w*a;
    MA=-(0.5*w*L^2)+(w*a^2);
    disp(['RA(N)=',num2str(RA)])
disp(['MA(N.m)=',num2str(MA)])

for x=0:0.1:L;
teta1=(1/(E*I))*((0.5*RA*x^2)+(MA*x));
y1=(1/(6*E*I))*((RA*x^3)+(3*MA*x^2));
teta2=-(1/(6*E*I))*(w*x^3);
y2=-(1/(24*E*I))*(w*x^4);

disp(['x(m)=',num2str(x)])


if x<=a;
teta3=(1/(3*E*I))*(w*x^3);
y3=(1/(12*E*I))*(w*x^4);

end
if x>a
   
teta3=(1/(3*E*I))*((w*x^3)-w*(x-a)^3);
y3=(1/(12*E*I))*((w*x^4)-w*(x-a)^4);

end

y=y1+y2+y3;
teta=teta1+teta2+teta3;


disp(['slope(rad)=',num2str(teta)])
disp(['defectio(m)=',num2str(y)])

end





