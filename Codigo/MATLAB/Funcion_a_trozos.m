%Este código permite graficar una función que se define a trozos.
%Para ello, primero se define cada trozo de la función con su respectivo
%intervalo

a = @(x) 7+x*0;
A = linspace(-36/7,-2,10);

b = @(x) x.^2+2*x+3;
B = linspace(-2,1,10);

c = @(x) 7*exp(-x.^2);
C = linspace(1,4,10);

d = @(x) 7*x-9;
D = linspace(4,36/7,10);

%Seguidamente, se definen los intervalos de graficación de los ejes X y Y

axis([-6,6,0,28])

%Por último, se utiliza el comando plot() para graficar la función deseada
%y anotan las titulaciones de los ejes y la información sobre la función.

plot(A,a(A),B,b(B),C,c(C),D,d(D)), 
title('Gráfica de una función f a trozos'), xlabel('x'), ylabel('y')

legend('7','x.^2+2*x+3','7*exp(1-x.^2)','7*x-9')
legend('Location','northwest')


