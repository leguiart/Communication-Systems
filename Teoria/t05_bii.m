%%Definiendo variables
clc;
delta=.01;%definiendo ancho de pulso
delta1=.001;
delta2=.0001;
T0=2*delta;%definiendo duracion del pulso
T01=2*delta1;
T02=2*delta2;
a0=(1/T0)*delta;%componente de directa
n=1:1:29; %definiendo valores de n
an=(1./(pi*n)).*sin((2*pi.*n)*(delta/T0));
bn=(1./(pi*n)).*(1.-cos((2*pi.*n)*(delta/T0)));
fm=3000;
t=0:1/fm:0.3;

%%Obteniendo valores de An, thetan, an, bn
An=((sqrt(2))./(pi.*n)).*(sqrt(1.-cos((2*pi.*n)*(delta/T0))));%vector de An
thetan=atan2(bn,an);%vector de theta sub n
n=[0,n];
An=[a0,An];
thetan=[0,thetan];

x=a0;
x1=a0;
x2=a0;
for i=1:15
    x=An(i)*cos(2*pi*n(i)*(1/T0)*t-thetan(i))+x;
    x1=An(i)*cos(2*pi*n(i)*(1/T01)*t-thetan(i))+x1;
    x2=An(i)*cos(2*pi*n(i)*(1/T02)*t-thetan(i))+x2;
end


%% Se definien subplots y donde estara situado cada uno en la ventana 
subplot(3,1,1);
plot(t,x, 'b');
title('x(t) a N=15 (delta=0.01)');
xlabel('Tiempo [segundos]');
ylabel('x(t)');
axis([0 0.05 0 2]);
grid;

%% 
subplot(3,1,2);
plot(t,x1, 'red');
title('x(t) a N=15 (delta=0.001)');
xlabel('Tiempo [segundos]');
ylabel('x(t)');
axis([0 0.005 0 2]);
grid;

%%
subplot(3,1,3);
plot(t,x2, 'black');
title('x(t) a N=15 (delta=0.0001)');
xlabel('Tiempo [segundos]');
ylabel('x(t)');
axis([0 0.005 0 2]);
grid;