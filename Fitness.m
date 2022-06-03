% Вычисление фитнесса
function [F] = Fitness(W, C, lambda)
    F = C * exp(lambda * W);
end