clc
clear

%% Euler
x=[0;0];
y=0;
h=0.1;
n=30/h;
for i=1:n
    x(:,i+1)=x(:,i)+h*f(y(i),x(:,i));
    y(i+1)=y(i)+h;
end
figure;
subplot(2,2,1)
plot(x(1,:),y)
xlabel('x')
ylabel('y')
title({'Euler';'dy = 0.1'})

x=[0;0];
y=0;
h=0.3;
n=30/h;
for i=1:n
    x(:,i+1)=x(:,i)+h*f(y(i),x(:,i));
    y(i+1)=y(i)+h;
end
subplot(2,2,2)
plot(x(1,:),y)
xlabel('x')
ylabel('y')
title({'Euler';'dy = 0.3'})

x=[0;0];
y=0;
h=0.6;
n=30/h;
for i=1:n
    x(:,i+1)=x(:,i)+h*f(y(i),x(:,i));
    y(i+1)=y(i)+h;
end
subplot(2,2,3)
plot(x(1,:),y)
xlabel('x')
ylabel('y')
title({'Euler';'dy = 0.6'})

x=[0;0];
y=0;
h=1;
n=30/h;
for i=1:n
    x(:,i+1)=x(:,i)+h*f(y(i),x(:,i));
    y(i+1)=y(i)+h;
end
subplot(2,2,4)
plot(x(1,:),y)
xlabel('x')
ylabel('y')
title({'Euler';'dy = 1'})

%% RK4
x=[0;0];
y=0;
h=0.1;
n=30/h;
for i=1:n
    k1=h*f(y(i),x(:,i));
    k2=h*f(y(i)+h/2,x(:,i)+k1/2);
    k3=h*f(y(i)+h/2,x(:,i)+k2/2);
    k4=h*f(y(i)+h,x(:,i)+k3);
    x(:,i+1)=x(:,i)+(k1+2*k2+2*k3+k4)/6;
    y(i+1)=y(i)+h;
end
figure;
subplot(2,2,1)
plot(x(1,:),y)
xlabel('x')
ylabel('y')
title({'RK4';'dy = 0.1'})

x=[0;0];
y=0;
h=0.3;
n=30/h;
for i=1:n
    k1=h*f(y(i),x(:,i));
    k2=h*f(y(i)+h/2,x(:,i)+k1/2);
    k3=h*f(y(i)+h/2,x(:,i)+k2/2);
    k4=h*f(y(i)+h,x(:,i)+k3);
    x(:,i+1)=x(:,i)+(k1+2*k2+2*k3+k4)/6;
    y(i+1)=y(i)+h;
end
subplot(2,2,2)
plot(x(1,:),y)
xlabel('x')
ylabel('y')
title({'RK4';'dy = 0.3'})

x=[0;0];
y=0;
h=0.6;
n=30/h;
for i=1:n
    k1=h*f(y(i),x(:,i));
    k2=h*f(y(i)+h/2,x(:,i)+k1/2);
    k3=h*f(y(i)+h/2,x(:,i)+k2/2);
    k4=h*f(y(i)+h,x(:,i)+k3);
    x(:,i+1)=x(:,i)+(k1+2*k2+2*k3+k4)/6;
    y(i+1)=y(i)+h;
end
subplot(2,2,3)
plot(x(1,:),y)
xlabel('x')
ylabel('y')
title({'RK4';'dy = 0.6'})

x=[0;0];
y=0;
h=1;
n=30/h;
for i=1:n
    k1=h*f(y(i),x(:,i));
    k2=h*f(y(i)+h/2,x(:,i)+k1/2);
    k3=h*f(y(i)+h/2,x(:,i)+k2/2);
    k4=h*f(y(i)+h,x(:,i)+k3);
    x(:,i+1)=x(:,i)+(k1+2*k2+2*k3+k4)/6;
    y(i+1)=y(i)+h;
end
subplot(2,2,4)
plot(x(1,:),y)
xlabel('x')
ylabel('y')
title({'RK4';'dy = 1'})
%% function
function ds=f(y,x)
L=30;
I=0.05;
E=1.25*10^8
F=200*y*exp(-y/15)/(y+5);
ds=zeros(2,1);
ds(1)=x(2);
ds(2)=F*(L-y)^2/(2*E*I);
end
