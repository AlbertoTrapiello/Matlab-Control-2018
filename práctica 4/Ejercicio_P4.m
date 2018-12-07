%%PRÁCTICA 4 
%%Del estudio de variables del sistema planteado podemos hallar las
%%siguientes matrices de las variables del sistema
A=[0 1 0 0;0 0 10 0;0 0 0 1;0 0 20 0];
B=[0;1;0;-1];
C=[1 0 0 0;0 0 1 0];
%%a)Compensación por realimentación de estados
%%comenzamos por determinar los polos deseados:
p1 = [ -1 -1.1 -1.2 -1.3];
%%Se hace uso entonces de la función "place" encargada de halla el vector
%%de ganancias k
k = place (A,B,p1)
%%b)Respuesta al escalón 
%%sin compensar
step(A,B,C,0);
%%compensada
Ar=A-B*k;
g=ss(Ar,B,C,0);
figure;
step(g);
%%c)Para los nuevos polos
p2=[-10 -10.1 -10.2 -10.3];
k2=place(A,B,p2);
%%d)Respuesta al escalón  
Ar2=A-B*k2;
figure;
step(Ar2,B,C,0);
%%A la vista de los resultados se puede comprobar que la respuesta inicial
%%del sistema no es estable debido a quecrece infinitamente. Por el
%%cotrario al obligar a los polos a colocarse donde nosotros queramos les
%%forzamos a estar en la parte izquierda del plano S, por lo que
%%conseguimos estabilizarlos
%Para el primer controlador obtenemos una respuesta oscilatoria y
%lenta, mientras que por el contrario en el caso de la segunda es muchísimo
%más rápida en ambas salidas y menos oscilatoria en el ángulo.

A=[0 1 0 0;0 0 4 0;0 0 0 1;0 0 140/3 0];
B=[0;2;0;2];

%% e) control LQR
Q1=[1 0 0 0;0 0 0 0;0 0 1 0;0 0 0 0];
R=1;
k= lqr(A,B,Q1,R)
%% f) respuestas ante escalón de:
%%compensada con LQR1
Ar=A-B*k;
figure;
step(Ar,B,C,0);
%% g) nueva k
Q2=[5000 0 0 0;0 0 0 0;0 0 100 0;0 0 0 0];
k2= lqr(A,B,Q2,R)
%%compensada con LQR2
Ar2=A-B*k2;
figure;
step(Ar2,B,C,0);
%%Como diferencia final entre los últimos controladores se puede observar
%%que con el segundo se mejora la velocidad de respuesta así como la
%%sobreoscilación de la respuesta al escalón