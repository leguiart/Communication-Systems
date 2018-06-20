x_bits= [ 0 0 1 0 0 1 1 0 1 0 1 1 1 0 1 0 1 0];
x=0;
Ts= 0.1;
n_bits = 3;
t_bits= 0 : Ts/n_bits : (length(x_bits)-1)*Ts/n_bits;
d= x_bits .* t_bits;
 figure 
for i=1:1:length(d)
    if d(i)~= 0
        format long;
        %x = x + heaviside(t-d(i));
        x= x+ rectpuls(t_bits-d(i)*3, 3*Ts/n_bits)
    end
end
t_bits
d
 plot(t_bits,x)
