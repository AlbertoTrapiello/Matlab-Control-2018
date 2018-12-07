%PID con ZN

G=tf(1, [1 2 1 0]);
nyquist(G); axis([-0.2,0.6,-0.4,0.4])
[Kc,pp,wg,wp]=margin(G); [Kc,wg], Tc=2*pi/wg;
[Gc1,Kp1]=zn(1,[Kc,Tc,10]); Kp1
[Gc2,Kp2,Ti2]=zn(2,[Kc,Tc,10]); [Kp2,Ti2]
[Gc3,Kp3,Ti3,Td3]=zn(3,[Kc,Tc,10]); [Kp3,Ti3,Td3] 
G_c1=feedback(G*Gc1,1); G_c2=feedback(G*Gc2,1);
G_c3=feedback(G*Gc3,1); step(G_c1,G_c2,G_c3); 
