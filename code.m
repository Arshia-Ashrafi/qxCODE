clc
clear
E=200*10^9;
P=52*10^3;
D=2.5;
L=9;
I=554*10^-6;

for x=0:0.5:D;
    RB=(P*x)/L;
tAB=(((RB*L^3)-(P*x^3))/(6*E*I));
tCB=((RB*L^3)/(48*E*I));
yc=((0.5*tAB)-tCB)*1000;
disp(['x(m)=',num2str(x)])
disp(['RB(N)=',num2str(RB)])
disp(['tAB(rad)=',num2str(tAB)])
disp(['yc(mm)=',num2str(yc)])

end

for x=D:0.5:4.5;

    RB=((P*x)/L)+P*((x-D)/L);
tAB=(((RB*L^3)-(P*x^3))/(6*E*I));
tCB=((RB*L^3)/(48*E*I));
yc=((0.5*tAB)-tCB)*1000;


disp(['x(m)=',num2str(x)])
disp(['RB(N)=',num2str(RB)])
disp(['tAB(rad)=',num2str(tAB)])
disp(['yc(mm)=',num2str(yc)])

end
for x=5:0.5:7;

    RB=((P*x)/L)+P*((x-D)/L);
tAB=(((RB*L^3)-(P*x^3)-(P*(x-D)^3)))/(6*E*I);
tCB=((RB*L^3)/(48*E*I))-(((P*(x-(L/2))^3))/(6*E*I));
yc=((0.5*tAB)-tCB)*1000;


disp(['x(m)=',num2str(x)])
disp(['RB(N)=',num2str(RB)])
disp(['tAB(rad)=',num2str(tAB)])
disp(['yc(mm)=',num2str(yc)])
end
for x=7.5:0.5:L;

    RB=((P*x)/L)+P*((x-D)/L);
tAB=(((RB*L^3)-(P*x^3)-(P*(x-D)^3)))/(6*E*I);
tCB=((RB*L^3)/(48*E*I))-(((P*(x-(L/2))^3))/(6*E*I))-(P*(x-D-L/2)^3)/(6*E*I);
yc=((0.5*tAB)-tCB)*1000;

disp(['x(m)=',num2str(x)])
disp(['RB(N)=',num2str(RB)])
disp(['tAB(rad)=',num2str(tAB)])
disp(['yc(mm)=',num2str(yc)])
end




