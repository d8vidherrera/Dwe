function [ iterMax, x , k ] = PuntoFijoA(g,a,x0, tol)
% Esta es una función sobre la iteración del punto fijo.
% Recibe como inputs: una función g, una constante a para que g sea
% contractiva, un valor de x inicial llamado x0 y la tolerancia deseada.
    k = 0;
    x = x0;
    xk = g(x,a);
    % Se define la constante de contracción de Lipschitz para g.
    L = 1/(2*a*sqrt(6));
    % Se calcula iterMax como un criterio de parada.
    iterMax = floor((log(tol*(1-L))-log(abs(xk-x0)))/log(L))+1;
    err = tol+1;
    % El script respeta las reglas de la iteración de punto fijo.
    if a<sqrt(2)
        disp("Error: valor de a fuera del conjunto contractivo de g.")
    end
    if L > 1
        disp("Error: La constante L muestra que g no es contractiva.")
    end
    while k < iterMax && err > tol && L <= 1 && a >= sqrt(2)
        x = g(x,a);
        err = abs(x-x0)/abs(x);
        disp(['Err relativo k=',num2str(k+1),': ',num2str(err),])
        x0 = x;
        k = k+1;
    end
end

% g = @(x,a) (1/a)*sqrt(7+sin(x));
% a = 2;
% [ iterMax, x , k ] = PuntoFijoA(g,a,1, 0.02)