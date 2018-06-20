%% Time specifications:
   Fs = 100;                      % samples per second
   dt = 1/Fs;                     % seconds per sample
   StopTime = 1;                  % seconds
   t = (0:dt:StopTime-dt);
   N = size(t,1);
   %% Sine wave:
   Fc = 2;                       % hertz
   x = 9.899*cos(2*pi*t);
   y = .446*cos(2*pi*2*t);
   z = .433*cos(2*pi*3*t);
   j = .285*cos(2*pi*4*t);
   k = .297*cos(2*pi*5*t);
   %% Fourier Transform:
   X = fftshift(fft(x));
   Y = fftshift(fft(y));
   Z = fftshift(fft(z));
   J = fftshift(fft(j));
   K = fftshift(fft(k));
   %% Frequency specifications:
   dF = Fs/N;                      % hertz
   f = -Fs/2:dF:Fs/2-dF;           % hertz
   %% Plot the spectrum:
   figure;
   subplot(2,3,1);
   plot(f,(X/N));
   xlabel('Frequency (in hertz)');
   ylabel('Vrms (Volts)');
   title('Espiga fundamental');
   subplot(2,3,2);
   plot(f, (Y/N));
   xlabel('Frequency (in hertz)');
   ylabel('Vrms (Volts)');
   title('2da espiga');
   subplot(2,3,3);
   plot(f, (Z/N));
   xlabel('Frequency (in hertz)');
   ylabel('Vrms (Volts)');
   title('3era espiga');
   subplot(2,3,4);
   plot(f, (J/N));
   xlabel('Frequency (in hertz)');
   ylabel('Vrms (Volts)');
   title('4ta Espiga');
   subplot(2,3,5);
   plot(f, (K/N));
   xlabel('Frequency (in hertz)');
   ylabel('Vrms (Volts)');
   title('5ta Espiga');