%M - ���-�� ����� � ��������
%N - ���-�� ��������� � ��������
%K (K/2N < 50%) - (?)
%h (0 < h < K/2) - ������������ �������� �� ��������� � �������� (�����) 
%pmut - ����������� �������
%C (> 1) - ���������  
%lambda (> 0) - ���������
function EvolutionAlg(M, N, K, h, pmut, Tstop, C, lambda)
  t = 1; F_s = 0;
  %��������� �������� s[M], ������� c[M] � ����. ������� B[MxM]
  [s,B,c] = Generation(M);
  %��������� ������� W[MxN] 
  Wmat = GenW(M,N,K);
  %���������� ������������� ���������� ������� Wmax
  %Wmax = MaxFitPot(M,c,B);
  %Fmax = Fitness(Wmax,C,lambda)
  while t <= Tstop
    % WWCM
    %����� ������������� ���� snew
    snew = Mutate(M,s,pmut);
    %���������� ��������� �������� f(s) � f(snew)
    f_s = CalcPhenotype(M,N,s,Wmat,h);
    f_snew = CalcPhenotype(M,N,snew,Wmat,h);
    %���������� ���������� ������� W(s) � W(snew)
    W_s = CalcFitPot(M,c,f_s,B);
    W_snew = CalcFitPot(M,c,f_snew,B);
    % �������
    F_s = Fitness(W_s, C, lambda);
    F_snew = Fitness(W_snew, C, lambda);
    if(F_snew > F_s)
      s = snew;
    else end
    time(t) = t;
    F(t) = F_s;
    t = t + 1;
  end
  plot(time,F);
  xlabel('Time')
  ylabel('Fitness')
  title('F(time)')

% EvolutionAlg(30,20,11,4,0.2,1000,6,0.0002)
% EvolutionAlg(80,50,4,0,0.01,1000,1,0.0001)
% EvolutionAlg(160,50,4,0,0.01,1000,1,0.0001)
% EvolutionAlg(500,500,4,0,0.1,1000,1,0.00001)