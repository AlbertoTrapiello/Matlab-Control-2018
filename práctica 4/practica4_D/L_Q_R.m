%%sistema en variables de estado con segundos datos
%%A=[0 1 0 0;0 0 -4 0;0 0 0 1;0 0 7/0.15 0];
%%B=[0;2;0;-1/0.15];
A=[0 1 0 0;0 0 4 0;0 0 0 1;0 0 140/3 0];
B=[0;2;0;2];
%% e) control LQR
Q=[1 0 0 0;0 0 0 0;0 0 1 0;0 0 0 0];
R=1;
k= lqr(A,B,Q,R)
%% f) respuestas ante escalón de:
%original (fig4 o 1)
g=ss(A,B,C,0);
figure;
step(g)
%%función compensada (fig5 o 2)
Ar=A-B*k;
g=ss(Ar,B,C,0);
figure;
step(g)
%% g) nueva k
Q2=[500 0 0 0;0 0 0 0;0 0 100 0;0 0 0 0];
k2= lqr(A,B,Q2,R)
Ar2=A-B*k2;