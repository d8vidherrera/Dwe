function [A] = AreaTriangulo(a,b,c)

% Esta función calcula el área de un triángulo cuando se insertan sus lados
% Se basa en la desigualdad triangular y la existencia de los triángulos.
% Inputs: a lado1, b lado2, c lado3
% Output: Área del triángulo
if a <= 0 || b <= 0 || c <= 0
    disp('Error: Lados menores o iguales a 0.')
elseif a+b>c && a+c>b && b+c>a
    p = (a+b+c)/2;
    A = sqrt((p*(p-a)*(p-b)*(p-c)));
    return
else
    disp('Error: No se cumple con la desigualdad triangular.')
end


