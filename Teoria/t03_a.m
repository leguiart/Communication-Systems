%%Definiendo funcion
clc;
fm=999; %Se define asi para que sean 1000 intervalos
f=-fm/2:fm/2; % Rango  de valores para las graficas de frecuencia
t1=0:1/fm:.03; % rango de valores para el tiempo (3 periodos)
t2=0:1/fm:.3; % rango de valores para el tiempo (30 periodos)
%Definiendo señal de voltaje
volt1=sin(2*pi*100*t1);
volt2=sin(2*pi*100*t2);
%% Se definien subplots y donde estara situado cada uno en la ventana 
subplot(2,1,1);
plot(t1,volt1, 'red');
title('Voltaje (3 periodos)');
xlabel('Tiempo [segundos]');
ylabel('V [Volts]');
grid;
%% 
subplot(2,1,2);
plot(t2,volt2, 'b');
title('Voltaje (30 periodos)');
xlabel('Tiempo [segundos]');
ylabel('V [Volts]');
axis([0 0.3 -2 2]);
grid;
