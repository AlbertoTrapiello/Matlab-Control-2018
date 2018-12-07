%EJERCICIO 1
%Con el sistema f�sico panteado se procede a obtener primero las ecuaciones
%fisicas que rigen al sistema, las cuales al representarlo en Laplace
%quedar�n de la siguiente manera:
 %�2(t) = F/m -k2(y2(t)-y1(t))/m- b2�2(t)/m;
 %�1(t) = k2(y2(t)-y1(t))/m- k1y1(t)/m-b1�1(t);
 %las cuales al pasar al estapcio de estados dan como resultado las
 %siguientes matrices:
%definicion del modelo 
A=[0 1 0 0;-6 -3 4 0; 0 0 0 1; 4 0 -4 -5];
B=[0;0;0;1];
C=[1 0 0 0;0 0 1 0];
g1=ss(A,B,C,0)
%RESPUESTA ENTRADA ESCAL�N
step(g1)
%RESPUESTA ENTRADA RAMPA
t = 0:0.1:10;
u = t;
figure(2);
lsim(g1,u,t);
%RESPUESTA ENTRADA PAR�BOLA
u = 0.5*t.^2;
figure(3);
lsim(g1,u,t);
%RESPUESTA ANTE ENTRADA NULA Y CNDIDICONES INICIALES 
x0 = [0 1 0 0];
figure(4);
initial(g1, x0);
%MATRICES CONTROLABILIDAD Y OBSERVABILIDAD
Q=ctrb(g1)
contr = rank(Q)
P=obsv(A,C)
observ = rank(P)
%Son controlables y observables debido a que el rango de las matrices son
%iguales a el tama�o de la matriz. 

