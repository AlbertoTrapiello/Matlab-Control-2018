%%sistema en variables de estado con los primeros datos
%%A=[0 1 0 0;0 0 10 0;0 0 0 1;0 0 20 0];
%%B=[0;1;0;-1];
  A=[0 1 0 0;0 0 -10 0;0 0 0 1;0 0 20 0];
  B=[0;1;0;1];
  C=[1 0 0 0;0 0 1 0];
%% a) obtengo el valor de la k, para la compensación por realimentación del estado
  p=[-1 -1.1 -1.2 -1.3];
  k=place(A,B,p)
%% b)respuesta al escalón de:
%%función sin compensar (fig1)
g=ss(A,B,C,0);
step(g)
%% función compensada (fig2)
Ar=A-B*k;
g=ss(Ar,B,C,0);
figure;
step(g)
%% c) nueva k
p2=[-10 -10.1 -10.2 -10.3];
k2=place(A,B,p2)
%% d) respuesta al escalón nueva función compensada (fig3)
Ar2=A-B*k2;
g=ss(Ar2,B,C,0);
figure;
step(g)
