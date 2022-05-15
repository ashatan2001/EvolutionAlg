% Вычисление потенциала фитнесса
function [W] = CalcFitPot(M,c,f,B) 
sum_cf = 0;
sum_Bff = 0;
for i = 1:M
    sum_cf = sum_cf + c(i)*f(i);
end
for i = 1:M
    for j = 1:M
        sum_Bff = sum_Bff + B(i,j)*f(j)*f(i);
    end
end
W = sum_cf + sum_Bff / 2;
end