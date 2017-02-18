function [MTF] = microscopeMTF(k,NA,lambda)
k = abs(k);
MTF = real((2/pi).*(acos(lambda.*k/(2*NA))-cos(acos(lambda.*k/(2*NA))).*sin(acos(lambda.*k/(2*NA)))));

end