function [snew] = Mutate(M,s,pmut)
    for i = 1:M
			    r = rand;
			    if (r < pmut)
            snew(i) = 1 - s(i);
          else snew(i) = s(i);end
    end
end