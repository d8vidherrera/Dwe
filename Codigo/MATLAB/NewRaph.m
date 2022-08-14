function [ x, k ] = NewRaph(f,df,x0, tol, iterMax )
k = 0;
x = x0;
err = tol+1;
    while k < iterMax && err >= tol 
        q = df(x);
            if q==0
                disp('Se anula la derivada')
            end
        x = x-f(x)/q;
        err = abs(x0-x)/abs(x);
        x0 = x;
        k = k+1;
    end
end