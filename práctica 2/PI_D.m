%PI-D:
figure;
G=tf(1,[1 2 1]); Kp = 3.829458496; Ti = 1.35; Td = 0.369; N=10; s=tf('s');
Gc=Kp*(1+1/Ti/s+Td*s/(1+Td*s/N));
G_c=feedback(G*Gc,1); Gc1=Kp*(1+1/s/Ti);
H=((1+Kp/N)*Ti*Td*s^2+Kp*(Ti+Td/N)*s+Kp)/(Kp*(Ti*s+1)*(Td/N*s+1));
G_c1=feedback(G*Gc1,H); step(G_c,G_c1); 

%Para este resultado podemos observar que la aproximación mediante el PI-D
%nos da una respuesta más rápida y con más sobre oscilación, sin embargo 
%que no se produce un salto tan pronunciado al inicio
