%M - размерность
%N - размерность
%K (K/2N < 50%) - (?)
%h (0 < h < K/2) - устойчивость генотипа по отношению к фенотипу (порог) 
%pmut - вероятность мутации
function EvolutionAlg(M, N, K, h, pmut, Tstop)
  t = 1; W_s = 0;
  %генерация генотипа s[M], вектора c[M] и симм. матрицы B[MxM]
  [s,B,c] = Generation(M);
  %генерация матрицы W[MxN] 
  Wmat = GenW(M,N,K);
  %вычисление максимального потенциала фитнеса Wmax
  Wmax = MaxFitPot(M,c,B);
  while t <= Tstop %&& W_s < 3000
    %поиск мутировавшего гена snew
    snew = Mutate(M,s,pmut);
    %вычисление признаков фенотипа f(s) и f(snew)
    f_s = CalcPhenotype(M,N,s,Wmat,h);
    f_snew = CalcPhenotype(M,N,snew,Wmat,h);
    %вычисление потенциала фитнеса W(s) и W(snew)
    W_s = CalcFitPot(M,c,f_s,B);
    W_snew = CalcFitPot(M,c,f_snew,B)
    % WWCM
    if(W_snew > W_s)
      s = snew;
      %W_s = W_snew;
    else end
    time(t) = t;
    W(t) = W_s;
    t = t + 1;
  end
  plot(time,W); 

% EvolutionAlg(20,15,11,4,0.2,1000)