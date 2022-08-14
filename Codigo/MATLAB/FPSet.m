function [nF,xmin,xmax] = FPSet(b,t,u)
for i = 1:b - 1
    for j=0:b-1
        for k =-u:u
            disp([num2str(i),'.',num2str(j),'x',num2str(b),'^',num2str(k),'=',num2str((i+(j/b))*b^k)]);
        end
    end
end
nf = 2*(b-1)*b^(t-1)*(2*u+1)+1;
xmin = b^(-u);
xmax = (1-b^(-t))*(b^(u+1));
end