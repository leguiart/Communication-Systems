binary =[1 1 0 1 0 0 1 0];
figure;
n=[1 2 2 3 
line(0:7,binary);
xlim([0.5 8.5]);
ylim([0 1.5]);
title(['Latest byte of data']);
drawnow;
pause(.5);