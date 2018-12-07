
%Ejemplo 1:

G=tf(1,[1,3,3,1]);
for Kp=[0.1:0.1:1], G_c=feedback(Kp*G,1); step(G_c), hold on; end
figure; rlocus(G,[0,15]) 

%al observar la salida se puede ver que con el aumento de la Kp la respuest
%a se vuelve cada vez menos amortiguada y que finalmente soberoscila. A su
%vez se puede ver cómo aumenta el error en régimen permanente, por lo que
%la mejor respuesta debe ser la primera de todas: Kp = 0.1 ay que el resto
%pese a ser más rápidas necesitan de una acción inteegradora para cometer
%menos error.

figure(3);

%PI:
G=tf(1,[1,3,3,1]); Kp=1; s=tf('s');
for Ti=[0.7:0.1:1.5]
Gc=Kp*(1+1/Ti/s); G_c=feedback(G*Gc,1); step(G_c), hold on; end
figure;

%Para este caso la mejor respuesta en régimen transitorio debe ser aquella
%con un mayor valor de Ti ya que este consigue que la respuesta sea menos
%oscilatoria y por tanto que tenga un pico de sobreoscilación menor.
%Claramente todas tienen más del recomendado 20% de pico de sobreoscilación
%y por ello la mejor sería la que menor pico de sobreoscilación tenga

figure(4);

%PID
Kp=1; Ti=1; s=tf('s');
for Td=[0.1:0.2:2]
Gc=Kp*(1+1/Ti/s+Td*s); G_c=feedback(G*Gc,1); step(G_c), hold on; end
figure

%Para este caso la mejor respuesta transitoria sería la de Td=1.6, ya que
%sobreoscila pero por debajo del 20% del valor final y es la más rápida de
%las que se encuentran por debajo del 1,2.

%Ejemplo 2:
Td=1; Gc=Kp*(1+1/Ti/s+Td*s); step(feedback(G*Gc,1)), hold on
for N=[100,1000,10000,1:10]
Gc=Kp*(1+1/Ti/s+Td*s/(1+Td*s/N)); G_c=feedback(G*Gc,1); step(G_c)
end
figure; [y,t]=step(G_c); err=1-y; plot(t,err) 

%Dentro de las distintas podibilidades de N se comprueba que para valores
%de N superiores a 7 no se nota el efecto sobre la respuesta en el tiempo
%aunque valores de N mayores sólo harían que la respuesta en altas
%frecuencias sea tanto mayor, y por eso la mejor será la de menor N. 

%Ejercicio 3:
%Tomando como ejemplo la FDT Gp:

Gp = tf ( 1, [1 2 1]);

%Para determinar el controlador PID se aplica el método de asignación
%directa de polos buscando una respuesta con un coeficiente de
%amortiguamiento de 0.707 y una frecuencia natural no amortiguada de 1.41 y
%alfa igual a 1: Finalmente quedan los siguientes valores para el control
%PID:

K = 3.829458496; Ti = 1.35; Td = 0.369; 
Gc = tf(K*[Ti*Td Ti 1], [Ti 0])

%Por último comprobamos ambas gráficas para ver que el control con PID se
%aproxima a la respuesta deseada

y = tf (2.83286, [1 3.41 4.829458496 2.8297]);
Gcc = Gc*Gp/(1 + Gc*Gp);
step(y); hold on; step(Gcc);
figure;

%Ejercicio 4:
%Ahora a la FDT anterior se le aplica un control PI-D:

G=tf(1,[1 2 1]); Kp = 3.829458496; Ti = 1.35; Td = 0.369; N=10; s=tf('s');
Gc=Kp*(1+1/Ti/s+Td*s/(1+Td*s/N));
G_c=feedback(G*Gc,1); Gc1=Kp*(1+1/s/Ti);
H=((1+Kp/N)*Ti*Td*s^2+Kp*(Ti+Td/N)*s+Kp)/(Kp*(Ti*s+1)*(Td/N*s+1));
G_c1=feedback(G*Gc1,H); step(G_c,G_c1); 
figure;
%Para este resultado podemos observar que la aproximación mediante el PI-D
%nos da una respuesta más rápida y con más sobre oscilación, sin embargo 
%que no se produce un salto tan pronunciado al inicio

%Ejercicio 5:

%Una vez guardadas las funciones zn y escribirpid procedemos a ejecutar el
%código para nuestra FDT

s=tf('s'); G = tf(1,[1 2 1]); 
step(G); k=dcgain(G)
L=0.76; T=2.72-L; [Gc1,Kp1]=zn(1,[k,L,T,10])
[Gc2,Kp2,Ti2]=zn(2,[k,L,T,10])
[Gc3,Kp3,Ti3,Td3]=zn(3,[k,L,T,10])

%Con una respuesta en lazo cerrado de:
G_c1=feedback(G*Gc1,1); G_c2=feedback(G*Gc2,1);
G_c3=feedback(G*Gc3,1); step(G_c1, G_c2, G_c3);
figure;
%Al contemplar las tres respuestas se puede observar que la repuesta que se
%correponde con el controlador porporcional comete el mayor error, es el más 
%lento y sobreosciola más que los demás. Mientras que con el PI se vuelve más
%preciso en régimen permantente y más rápido, pero el mejor resultado se obiene
%con el PID ya que combina las tres acciones consiguiendo una respuesta que 
%es la más rápida, suave, precisa y difícil de ajustar.

%Ejercicio 6:

%Una vez guardada la función para el cálculo de Chreswick se procede a
%calcular los controladores para nuestro sistema.

s=tf('s'); G = tf(1,[1 2 1]); 
[Gc1,Kp,Ti,Td]=zn(3,[k,L,T,N])
[Gc2,Kp,Ti,Td]= chreswickpid (3,1,[k,L,T,N,0])
[Gc3,Kp,Ti,Td]= chreswickpid (3,1,[k,L,T,N,20])
[Gc4,Kp,Ti,Td]= chreswickpid (3,2,[k,L,T,N,0]) 
step(feedback(G*Gc1,1),feedback(G*Gc2,1),feedback(G*Gc3,1), feedback(G*Gc4,1),10); 
figure;
step(feedback(G, Gc1),feedback(G, Gc2),feedback(G,Gc3), feedback(G,Gc4),30);
figure;

%Con chreswick se puede observar que las respuestas sse vuelven más rápidas
%y oscilatorias que con el método de ZN

%Ejercicio 7:

G=tf(1,[1 2 1]);
[Gc1,Kp1]=cohenpid(1,[k,L,T,10])
[Gc2,Kp2,Ti2]=cohenpid(2,[k,L,T,10])
[Gc3,Kp3,Ti3,Td3]=cohenpid(5,[k,L,T,10])
[Gc4,Kp4,Ti4,Td4]=cohenpid(3,[k,L,T,10]) 
G_c1=feedback(G*Gc1,1); G_c2=feedback(G*Gc2,1);
G_c3=feedback(G*Gc3,1); G_c4=feedback(G*Gc4,1);
step(G_c1,G_c2,G_c3,G_c4,10) 

%Fianlmente con Cohenpid se pueden observar diferencias entre 
