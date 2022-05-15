% Вычисление максимального потенциала фитнесса
function [Wmax] = MaxFitPot(M,c,B)
B_inv = inv(B);
sum_Bc = 0;
for i = 1:M
    for j = 1:M
        sum_Bc = sum_Bc + B_inv(i,j)*c(i)*c(j);
    end
end
Wmax = -sum_Bc / 2;
end