function [W] = GenW(M,N,K)
    for i = 1:N
        for j = 1:M
          r = rand;
          if (r < K/N)
            if (r < K/(2*N))
              W(i,j) = 1;
            else W(i,j) = -1; end
          else W(i,j) = 0; end
        end
    end
end