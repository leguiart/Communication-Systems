%%Definiendo funcion
clc;
fm=999; %Se define asi para que sean 1000 intervalos
f=-fm/2:fm/2; % Rango  de valores para las graficas de frecuencia
t=0:1/fm:1; % rango de valores para el tiempo
%Definiendo señal de voltaje
volt=20*cos(2*pi*100*t)+10*cos(2*pi*50*t);
%Definiendo Ruido
ruido= 20*randn([size(t),1]);
% Definiendo señal con ruido
sr= volt + ruido;
% FFT Fast Fourier Transform, transformada de fourier para las señales
% temporales
volt_f=abs(fftshift(fft(volt)))/fm;
ruido_f=abs(fftshift(fft(ruido)))/fm;
sr_f= abs(fftshift(fft(sr)))/fm;
%% A las graficas de frecuencia se les determina un rango en el eje frecuencial
% ya que no se puede apreciar nada en un rango tan bajo como el de las
% graficas en el tiempo
 subplot(3,2,2);
 stem(f, volt_f, 'm');
 title('Voltaje en frecuencia');
 xlabel('frecuencia [Hertz]');
 ylabel('Vrms [Volts]');
 axis([-150 150 0 12])
 % Aqui el ultimo argumento de subplot denota que la grafica ocupara varios
 % espacios
 subplot(3,2,[4,6]);
 stem(f, sr_f, 'm');
 title('Voltaje con ruido en frecuencia');
 xlabel('frecuencia [Hertz]');
 ylabel('Vrms [Volts]');
  axis([-150 150 0 12])
%% Se definien subplots y donde estara situado cada uno en la ventana 
subplot(3,2,3);
plot(t,ruido, 'y'); %Plot para decirle a matlab que grafique
title('Ruido');
xlabel('Tiempo [segundos]');
ylabel('Vrms [Volts]');
%%
subplot(3,2,1);
plot(t,volt, 'red');
title('voltaje');
xlabel('Tiempo [segundos]');
ylabel('Vrms [Volts]');
%% 
subplot(3,2,5);
plot(t,sr, 'b');
title('Voltaje con ruido');
xlabel('Tiempo [segundos]');
ylabel('Vrms [Volts]');
axis([0 0.1 -40 50]);
grid;
