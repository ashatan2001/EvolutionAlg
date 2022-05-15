% Генерация векторов s, c и симметричной матрицы B
function [s,B,c] = Generation(M)
s = randi([0,1],1,M);
c = randi([0,1],1,M);
B = randi([0,1],M,M);
B = round((B+transpose(B))/2); %симметричность м-цы B
%disp(c)
%disp(s)
%disp(b)
end