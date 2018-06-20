clc;
%----------------your signal y - and time x-------------
n=10
y=repmat([1 0],1,n)
y=y(:)
x=1:n
%--------------sawtooth---------------------
x=[x;x]
x=x(:)
close
plot(x,y,'r')
%---------square-------------
figure
y=[y';y']
y=y(:)
x=1:numel(y)/2
x=[x;x];
x=x(:)
x(1)=[];
y(end)=[]
plot(x,y,'r')
xlim([x(1) x(end)])