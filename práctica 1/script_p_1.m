%Para comenzar cargamos los datos 
load('datosG1');%%carga los datos en las variables t4,y4 y t6,y6
%Procedemos a representar la gr�fcica de y6
plot(t4,y4,'r')
%Para hallar los datos usamos los datos de la gr�fica  y elegimos el modelo
%aproximado de 3 par�metros con un retardo y un polo
%De esta aproximaci�n sacamos la siguiente funci�n de transferencia del
%modelo
g4 = tf(2, [0.19875 1], 'InputDelay', 0.1988)
%Y representamos la respuesta a un escal�n del modelo aproximado
%para poder comparar con la anterior usamos el comando hold on para no
%borrar la enterior gr�fica
hold on; step (g4,'g')
%Ahora para compararlo con la salida del ident de la toolbox de System
%Identification
%se crean vectores de 1's del tama�o de las variables de la salida para que luego en la funci�n ident las pueda utilizar
u4 = ones(size(t4));
u6 = ones(size(t6));
ident
%Para configurar el ident correctamente se debe primero selecccionar en
%import data->Time domain data, y como entrada la variable u6 o u4 y en
%output la corresponiente y com sample time la fracci�n correspondiente (xmax/n�mero de datos del vector o el primer dato de la t4)
%a continuaci�n en Estimate-> se selecciona Process Models y
%dentro de este se selecciona el tipo de modelado que se desee (con o sin ceros, retraso, etc) y
%finalmente con la salida se arrastra al Workspace y ya estar� disponible
%bajo el nombre que se le haya definido (P4,P6) en forma de polinomi
%numerador y denominador

%como resultado de la configuraci�n del modelo a calcular por la funci�n
%ident tendremos un polinomio P4 que es el resultado que nos arroja el
%ident
G4 = tf(P4)%hay que pasarlo a tf para representarlo
hold on; step(G4,'b')
%Repetimos para la segunda gr�fica
figure(2);
plot(t6,y6,'r')
g6 = tf(2, [0.2973^2 2*0.2973 1], 'InputDelay', 0.045)
hold on; step (g6,'g')
G6 = tf(P6)
hold on; step(G6,'b')

