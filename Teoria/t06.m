%%Definiendo variables
clc;
delta=.0000001;%definiendo ancho de pulso
%para cada caso:
%delta=.00000005
%delta=.00000001
T0=2*delta;%definiendo duracion del pulso
a0=(1/T0)*delta;%componente de directa
n=1:1:99; %definiendo valores de n
R=1000;
C=.000000000002;
%%Obteniendo valores de An, thetan, an, bn
Anx=((sqrt(2))./(pi.*n)).*(sqrt(1.-cos((2*pi.*n)*(delta/T0))));%vector de An
an=(1./(pi*n)).*sin((2*pi.*n)*(delta/T0));
bn=(1./(pi*n)).*(1.-cos((2*pi.*n)*(delta/T0)));
Hn=1./(sqrt(1+power(n.*2*pi*(1/T0)*R*C,2)));
Any=Anx.*Hn;
theta_h=atan2((n.*2*pi*(1/T0)*R*C),1).*-1;
thetan=atan2(bn,an);
theta_h_y=theta_h+thetan;
n=[0,n];
theta_h=[0,theta_h];
Hn=[1,Hn];
an=[a0,an];
bn=[0,bn];
Anx=[a0,Anx];
Any=[0.5,Any];
thetan=[0,thetan];
theta_h_y=[0,theta_h_y];
an=an';
bn=bn';
Anx=Anx';
thetan=thetan';
n=n';
theta_h=theta_h';
Hn=Hn';
Any=Any';
theta_h_y=theta_h_y';
tabla=table(n,Anx,thetan);
disp(tabla);
tabla2=table(n,Hn,theta_h);
disp(tabla2);
tabla3=table(n,Any,theta_h_y);
disp(tabla3);

%% Graficas del espectro en amplitud y en fase
subplot(2,3,1);
stem(n.*(1/T0), Anx);
title('Espectro de Amplitud');
xlabel('Frecuencia [Hz]');
ylabel('A_n');
axis([0 400000000 0 0.7]);
grid;


subplot(2,3,4);
stem(n.*(1/T0), thetan);
title('Espectro de Fase');
xlabel('Frecuencia [Hz]');
ylabel('Theta_n');
axis([0 500000000 0 3.5]);
grid;

subplot(2,3,2);
stem(n.*(1/T0), Hn);
title('Respuesta en Amplitud');
xlabel('Frecuencia [Hz]');
ylabel('H_n');
axis([0 400000000 0 1.2]);
grid;


subplot(2,3,5);
stem(n.*(1/T0), theta_h);
title('Respuesta de Fase');
xlabel('Frecuencia [Hz]');
ylabel('Theta_h');
%axis([0 500000000 0 -2]);
grid;


subplot(2,3,3);
stem(n.*(1/T0), Any);
title('Espectro de Amplitud de Salida');
xlabel('Frecuencia [Hz]');
ylabel('A_y');
axis([0 400000000 0 0.7]);
grid;


subplot(2,3,6);
stem(n.*(1/T0), theta_h_y);
title('Espectro de Fase de la salida');
xlabel('Frecuencia [Hz]');
ylabel('Theta_hy');
axis([0 500000000 -2 3.3]);
grid;
