%Para comenzar cargamos los datos 
load('datosG1');
%Procedemos a representar la gráfcica de y6
plot(t4,y4,'r')
%Para hallar los datos usamos los datos de la gráfica  y elegimos el modelo
%aproximado de 3 parámetros con un retardo y un polo
%De esta aproximación sacamos la siguiente función de transferencia del
%modelo
g4 = tf(2, [0.19875 1], 'InputDelay', 0.1988)
%Y representamos la respuesta a un escalón del modelo aproximado
%para poder comparar con la anterior usamos el comando hold on para no
%borrar la enterior gráfica
hold on; step (g4,'g')
%Ahora para compararlo con la salida del ident de la toolbox de System
%Identification
u4 = ones(size(t4));
u6 = ones(size(t6));
ident
%como resultado de la configuración del modelo a calcular por la función
%ident tendremos un polinomio P4 que es el resultado que nos arroja el
%ident
G4 = tf(P4)
hold on; step(G4,'b')
%Repetimos para la segunda gráfica
figure(2);
plot(t6,y6,'r')
g6 = tf(2, [0.2973^2 2*0.2973 1], 'InputDelay', 0.045)
hold on; step (g6,'g')
G6 = tf(P6)
hold on; step(G6,'b')

