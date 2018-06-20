%%Definiendo variables
clc;
delta=.01;%definiendo ancho de pulso
T0=10*delta;%definiendo duracion del pulso
a0=(1/T0)*delta;%componente de directa
n=1:1:29; %definiendo valores de n

%%Obteniendo valores de An, thetan, an, bn
An=((sqrt(2))./(pi.*n)).*(sqrt(1.-cos((2*pi.*n)*(delta/T0))));%vector de An
an=(1./(pi*n)).*sin((2*pi.*n)*(delta/T0));
bn=(1./(pi*n)).*(1.-cos((2*pi.*n)*(delta/T0)));
thetan=atan2(bn,an);
n=[0,n];
an=[a0,an];
bn=[0,bn];
An=[a0,An];
thetan=[0,thetan];
an=an';
bn=bn';
An=An';
thetan=thetan';
n=n';
tabla=table(n,an,bn,An,thetan);
disp(tabla);

%% Graficas del espectro en amplitud y en fase
subplot(2,1,1);
stem(n.*(1/T0), An);
title('Espectro de Amplitud');
xlabel('Frecuencia [Hz]');
ylabel('An');
grid;

%%
subplot(2,1,2);
stem(n.*(1/T0), thetan);
title('Espectro de Fase');
xlabel('Frecuencia [Hz]');
ylabel('Theta_n');
grid;
