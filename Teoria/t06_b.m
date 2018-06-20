%%Definiendo variables
clc;
%delta=.0000001;%definiendo ancho de pulso
%delta=.00000005;
delta=.00000001;
T0=2*delta;%definiendo duracion del pulso
T01=2*delta1;
T02=2*delta2;
a0=(1/T0)*delta;%componente de directa
n=1:1:99; %definiendo valores de n
an=(1./(pi*n)).*sin((2*pi.*n)*(delta/T0));
bn=(1./(pi*n)).*(1.-cos((2*pi.*n)*(delta/T0)));
fm=3000;
t=0:1/fm:0.3;
R=1000;
C=.000000000002

%%Obteniendo valores de An, thetan, an, bn
Anx=((sqrt(2))./(pi.*n)).*(sqrt(1.-cos((2*pi.*n)*(delta/T0))));%vector de An
thetan=atan2(bn,an);%vector de theta sub n
Hn=1./(sqrt(1+power(n.*2*pi*(1/T0)*R*C,2)));
Any=Anx.*Hn;
theta_h=atan2((n.*2*pi*(1/T0)*R*C),1).*-1;
theta_h_y=theta_h+thetan;
n=[0,n];
Anx=[a0,Anx];
thetan=[0,thetan];
theta_h_y=[0,theta_h_y];
Any=[0.5,Any];
y=0;
for i=1:100
    y=Any(i)*cos(2*pi*n(i)*(1/T0)*t-theta_h_y(i))+y;
end


%% Se definien subplots y donde estara situado cada uno en la ventana 
plot(t,y, 'b');
title('y(t) a N=100 (delta=.00000001)');
xlabel('Tiempo [segundos]');
ylabel('x(t)');
axis([0 0.005 0 1]);
grid;
