function flag = isFilled(fFactor,N)
flag = all(abs(fFactor(1:N)-1) < 4*eps);