close all;
clear all;
clc;

Amp=1; N=10;                        % Par�metros de la se�al x_a(t), N = N�mero de coeficientes de la Serie de Fourier
FLAG_PLOT=1;                        % Indica si graficar (1) o no (0)

f0=100;                             % Frecuencia fundamental de la se�al x_a(t)
T0=1/f0;                            % Per�odo fundamental de la se�al x_a(t)
Res=32;                             % Muestras por cada per�odo fundamental de la se�al pseudo-anal�gica, les hab�a dicho 8, pueden dejarla como 32
fs_mat=Res*N*f0;                    % Frecuencia de muestreo para generar la se�al pseudo-anal�gica (NO confundir con frecuencia de muestreo para discretizarla)
Ts_mat=1/fs_mat;                    % Intervalos de muestreo para generar la se�al pseudo-anal�gica
t=0:Ts_mat:4*T0;                    % Vector de tiempo, de 0 a 4 per�odos (para graficar)

%C�lculo de los coeficientes de la serie de Fourier y reconstrucci�n de la se�al x(t)
a0=0;                               % Componente de DC
x_a=a0;
A=rand(1,N);
Theta=pi*A;
for n=1:1:N
    x_temp=A(n)*cos(2*pi*f0*n*t-Theta(n));
    x_a=x_a+x_temp;
end

% Discretizar la se�al pseudo-anal�gica

S=4;            
fs=S*N*f0;      % Frecuencia de muestreo = S veces la frecuencia m�xima (N*f0) de la se�al pseudo-anal�gica
Ts=1/fs;        % Per�odo de muestreo [s]

% x_dis(1)=x_a(1+0*Res/S); % x_dis es la se�al pseudo-anal�gica muestreada. S�lo obtengo como ejemplo las primeras 4 muestras. Generalicen para muestrear toda la se�al
% x_dis(2)=x_a(1+1*Res/S); 
% x_dis(3)=x_a(1+2*Res/S);
% x_dis(4)=x_a(1+3*Res/S);
%etc...

t_dis=0:Ts:4*T0;
% t_dis=t_dis(1:4); % t_dis(1:4) sirve para limitar el vector de tiempo para s�lo las primeras cuatro muestras que les puse de ejemplo. Generalizar para todo el tiempo que dura x_a(t)

for i=1 : 1 : size(t_dis, 2)
   x_dis(i)=x_a(1+(i-1)*Res/S);
end


% Cuantizar la se�al muestreada (esta es su tarea)
x_dis_max = max(x_dis);
x_dis_min =  min(x_dis);
af=x_dis_max-x_dis_min;
N2=8;
lvl=af/N2;
aux=0;
n_bits=log2(N2);
for i = 1 : 1 : size(t_dis,2)
    for n = 0 : 1 : N2
        if x_dis(i) >= x_dis_min+lvl*n
            if n==N2
                x_cuant(i) = x_dis_min+lvl*(n-1);
                aux=n-1;
                break;
            else
                x_cuant(i) = x_dis_min+lvl*n;  
            end
        else
            aux=n-1;
            break;
        end
    end
    aux=de2bi(aux, 'left-msb');
    while length(aux)<n_bits
        aux=[0,aux];
    end
    if i==1
        x_bits = aux;
    else
        x_bits = [x_bits, aux];
    end
end


% Codificar la se�al cuantizada (esta es su tarea)
Tb=Ts/n_bits;
t_bits=0:Tb:(length(x_bits)-1)*Tb;
%format long;
d=x_bits.*t_bits;
d;
x=0;
%x_bits
for i=1:1:length(d)
    if d(i)~= 0
        format long;
        %x = x + heaviside(t-d(i));
        x= x+ rectpuls(t_bits-d(i), Ts/n_bits);
    end
end
%x=[x;x]
%x=x(:);
%t2=[t;t]
%t2=t2(:)
% introduciendo ruido
y = wgn(1,length(x),0.1,'linear');
sruidosa = x + y;
x_bits
sruidosa
%Promediar y volver a graficar

%x= pulstran(t_bits, d, 'rectpuls', Ts/n_bits);
% Graficas
if FLAG_PLOT == 1
    figure
    subplot(2,1,1);
    plot(t,x_a);                % Gr�fica de la se�al x_a(t)
    grid on; xlabel('Tiempo [s]','fontsize',20); ylabel('x_a(t)','fontsize',20);
    % xlim([0 4*T0]);
    hold on                     % Sirve para graficar dos curvas en la misma gr�fica. Las se�ales cuantizadas de tarea las quiero as� traslapadas con la se�al original
    stem(t_dis,x_dis);% Gr�fica de la se�al muestread
    stem(t_dis, x_cuant);
    subplot(2,1,2);
    plot(t_bits, sruidosa, 'Linewidth', 1);
    grid on; xlabel('Tiempo [s]','fontsize',20); ylabel('Sruidosa_b(t)','fontsize',20);
    xlim([0 n_bits*Ts ]);
    %axis([0 3 0 1.2]);
    hold off
end
