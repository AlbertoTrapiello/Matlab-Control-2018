%definicion del modelo
A=[0,-6,0,4;1,-3,0,0;0,4,0,-4;0,0,1,-5];
B=[0;0;1;0];
C=[0,1,0,0;0,0,0,1];
g1=ss(A,B,C,0);
%RESPUESTA ENTRADA ESCALÓN
step(g1)
%RESPUESTA RAMPA
t=0:0.1:30;
u=t;
lsim(g1,u,t)
%RESPUESTA PARÁBOLA
u=0.5*t.^2;
lsim(g1,u,t)
%ENTRADA NULA Y CONDICIONES INICIALES
x0=[0,1,0,0];
initial(g1,x0)
%MATRICES CONTROLABILIDAD Y OBSERVABILIDAD
Q=ctrb(g1)
rank(Q)
P=obsv(A,C)
rank(P)

%EJERCICIO 2
%
s=tf('s')
g2=tf((5/3)/((s+1)*(s+2)*(s+3)))

  
num=5/3;
den=[1 6 11 6];
[A,B,C,D]=tf2ss(num,den)
  
%RESPUESTA ESCALÓN
step(g2)
%RESPUESTA RAMPA
t=0:0.1:8;
u=t;
lsim(g2,u,t)
%RESPUESTA PARÁBOLA
u=0.5*t.^2;
lsim(g2,u,t)
%ENTRADA NULA Y CONDICIONES INICIALES
x0=[1,0,0];
initial(g2,x0)
x0=[0,1,0];     
initial(g2,x0)
%MATRICES CONTROLABILIDAD Y OBSERVABILIDAD
Q=ctrb(g2)
rank(Q)
P=obsv(A,C)
rank(P)
%
