%Ejercicio 7:
figure;
G=tf(1,[1 2 1]);
[Gc1,Kp1]=cohenpid(1,[k,L,T,10])
[Gc2,Kp2,Ti2]=cohenpid(2,[k,L,T,10])
[Gc3,Kp3,Ti3,Td3]=cohenpid(5,[k,L,T,10])
[Gc4,Kp4,Ti4,Td4]=cohenpid(3,[k,L,T,10]) 
G_cc_P=feedback(G*Gc1,1); G_cc_PI=feedback(G*Gc2,1);
G_cc_PD=feedback(G*Gc3,1); G_cc_PID=feedback(G*Gc4,1);
step(G_cc_P,G_cc_PI,G_cc_PD,G_cc_PID,10) 

%Fianlmente con Cohenpid se pueden observar diferencias entre 