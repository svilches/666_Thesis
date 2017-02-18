function [y] = Gauss(x,a,mu,sigma)

y = a*exp(-power(((x-mu)/(sigma*sqrt(2))),2));

end
