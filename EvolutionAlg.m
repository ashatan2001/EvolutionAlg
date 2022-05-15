%M - �����������
%N - �����������
%K (K/2N < 50%) - (?)
%h (0 < h < K/2) - ������������ �������� �� ��������� � �������� (�����) 
%pmut - ����������� �������
function EvolutionAlg(M, N, K, h, pmut, Tstop)
  t = 1; W_s = 0;
  %��������� �������� s[M], ������� c[M] � ����. ������� B[MxM]
  [s,B,c] = Generation(M);
  %��������� ������� W[MxN] 
  Wmat = GenW(M,N,K);
  %���������� ������������� ���������� ������� Wmax
  Wmax = MaxFitPot(M,c,B);
  while t <= Tstop %&& W_s < 3000
    %����� ������������� ���� snew
    snew = Mutate(M,s,pmut);
    %���������� ��������� �������� f(s) � f(snew)
    f_s = CalcPhenotype(M,N,s,Wmat,h);
    f_snew = CalcPhenotype(M,N,snew,Wmat,h);
    %���������� ���������� ������� W(s) � W(snew)
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