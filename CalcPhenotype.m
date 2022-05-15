function [f] = CalcPhenotype(M,N,s,W,h)
    for j = 1:M
        f(j) = 0;
        for i = 1:N
            f(j) = f(j) + W(i,j)*s(j);
        end
        f(j) = sigma(f(j) - h);
    end
    
end