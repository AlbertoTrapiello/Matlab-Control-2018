%%Por �ltimo para hacer mediante arx
g = tf([1 0.5], [1 -1.5 0.7], 1)%genera una funci�n de transferencia
[y t] = step (g) %saca los valores de la t y de la y 
u = ones(size(y)); %crea �la entrada
datos = iddata(y,u,1)%saca los valores de los datos que necesita arx para funcionar
modelo = arx(datos, [2 2 0])%calcula el modelo arx
garx0 = tf ([0.75 0.75 0], [1 -1.5 0.7], 1)%se inventa una funci�n que no se ve que la saque del modelo ni nada
step(g,garx0)