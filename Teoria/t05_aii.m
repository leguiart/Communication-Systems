%%Definiendo variables
clc;
delta=.001;%definiendo ancho de pulso
T0=2*delta;%definiendo duracion del pulso
a0=(1/T0)*delta;%componente de directa
n=1:1:29; %definiendo valores de n

%%Obteniendo valores de An, thetan, an, bn
An=((sqrt(2))./(pi.*n)).*(sqrt(1.-cos((2*pi.*n)*(delta/T0))));%vector de An
thetan=atan(csc((2*pi.*n)*(delta/T0))-cot((2*pi.*n)*(delta/T0)));%vector de theta sub n
an=(1./(pi*n)).*sin((2*pi.*n)*(delta/T0));
bn=(1./(pi*n)).*(1.-cos((2*pi.*n)*(delta/T0)));
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