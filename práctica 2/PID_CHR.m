%Una vez guardada la función para el cálculo de Chreswick se procede a
%calcular los controladores para nuestro sistema.
figure;

s=tf('s'); G = tf(1,[1 2 1]); 
[Gc1,Kp,Ti,Td]=zn(3,[k,L,T,N])
[Gc2,Kp,Ti,Td]= chreswickpid (3,1,[k,L,T,N,0])
[Gc3,Kp,Ti,Td]= chreswickpid (3,1,[k,L,T,N,20])
[Gc4,Kp,Ti,Td]= chreswickpid (3,2,[k,L,T,N,0]) 
G_zn = feedback(G*Gc1,1);
G_chr_2 = feedback(G*Gc2,1);
G_chr_3 = feedback(G*Gc3,1);
G_chr_4 = feedback(G*Gc4,1);
step(G_zn, G_chr_2, G_chr_3, G_chr_4, 10); 

%Con chreswick se puede observar que las respuestas sse vuelven menos rápidas
%y menos oscilatorias que con el método de ZN