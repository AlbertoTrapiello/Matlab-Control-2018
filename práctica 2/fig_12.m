Td=1; Gc=Kp*(1+1/Ti/s+Td*s); step(feedback(G*Gc,1)), hold on
for N=[100,1000,10000,1:10]
Gc=Kp*(1+1/Ti/s+Td*s/(1+Td*s/N)); G_c=feedback(G*Gc,1); step(G_c)
end
figure; [y,t]=step(G_c); err=1-y; plot(t,err); figure
%Dentro de las distintas podibilidades de N se comprueba que para valores
%de N superiores a 25 no se nota el efecto sobre la respuesta en el tiempo
%aunque valores de N mayores sólo harían que la respuesta en altas
%frecuencias sea tanto mayor, y por eso la mejor será la de menor N. 

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

%y = A/(s+alfa*wn)(s^2+2*sita*wn+wn^2);

y = tf (2.83286, [1 3.41 4.829458496 2.8297]);
Gcc = Gc*Gp/(1 + Gc*Gp);
step(y); hold on; step(Gcc);
figure;