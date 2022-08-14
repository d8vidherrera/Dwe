function [x,k,T] = NewRapT(f,df,x0,tol,iterMax)
% Esta función tiene como inputs una función f, su derivada df, un valor
% inicial x0, la tolerancia tol y el número máximo de iteraciones.
% Como output tiene una tabla T sobre la cual se escriben; en la primera
% columna, el número k-ésimo de iteraciones; en la segunda columna, los 
% valores de cada x_k y en la tercera columna la evaluación de cada f(x_k).

% Se establecen condiciones iniciales sobre las cuales operará la función
k = 0;
x = x0;
err = tol + 1;
% Se escribe un while loop que funciona como un criterio de inicio y
% parada.
    while k < iterMax && err >= tol 
        derivada = df(x);
% Se muestra un mensaje de error si la derivada de la función es igual a 0.
            if derivada == 0
                disp('Error: La derivada de f es 0.')
            end
        x = x-f(x)/derivada;
% Se calcula el error de la aproximación.
        err = abs(x0-x)/abs(x);
        x0 = x;
        k = k + 1;
% Se muestra una tabla con valores deseados.
            T(k,:) = [k x f(x)];
    end
end


% f = @(x) sind(x)-sqrt(19.6/(75/7).^2);
% df = @(x) cosd(x);
% [x,k,T] = NewRapT(f,df,1,1e-3,999)