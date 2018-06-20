%%Modulacion AM
clc;
AmpM=1;
AmpP=2;
%% DEFINIR FUNCIONES

d=5;% Duracion en segundos
fs=2000; % # de muestras
fm=10; % frecuencia de muestreo
fp=100; % frecuencia de la portadora (10 veces la frecuencia de muestreo)

t = [0:d*fs]/fs;
vm= AmpM*cos(2*pi*fm*t);
vp= AmpP*cos(2*pi*fp*t);
vm=vm+2; %%Voltaje de offset
AM= vm.*vp;

%%FUNCIONES EN LA FRECUENCIA;
f= [-d*fs/2 : d*fs/2];
AMFFT = abs(fftshift(fft(AM)))/fs;
subplot(2,1,1);
stem(f, AMFFT);
%axis([-(fp+2*fm), fp+2*fm, 0, AmpP+0.5]);
axis([-600, 600, 0, AmpP+8]);




%% Modulando en AM

subplot(2,1,2);
hold on;
plot(t, vm+1);
plot(t, AM);
plot(t, vp-1);
hold off;
xlim([0 fm/20]);
ylim([-10 10]);





