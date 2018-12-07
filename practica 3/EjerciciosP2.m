%EJERCICIO 2
%para este segundo primero se definen los vectores de los ceros, polos y
%ganancia estática 
z = [];
p = [-1,-2,-3];
k = 5/3;

%Mediante el uso de la función zp2ss que permite pasar del los polos y
%ceros a la matrices del espacio de estados

[A, B, C, D] = zp2ss (z, p, k)

%RESPUESTA ANTE EL ESCALÓN
figure;
step(A,B,C,D)
%RESPUESTA ANTE LA RAMPA
t = 0:0.1:10;
u = t;
figure;
lsim(ss(A,B,C,D),u,t)
%REPSUESTA ANTE LA PARÁBOLA 
u = 0.5*t.^2;
figure;
lsim(ss(A,B,C,D),u,t)
%RESPUESTA ANTE ENTRADA NULA Y CONDICIONES INICIALES
g1=ss(A,B,C,0);
x0 = [1 0 0];
figure;
initial(g1, x0);
x0 = [0 1 0];
figure;
initial(g1, x0);
%COTNROLABILIDAD Y OBSERVABILIDAD
Q=ctrb(g1)
contr = rank(Q)
P=obsv(A,C)
observ = rank(P)

