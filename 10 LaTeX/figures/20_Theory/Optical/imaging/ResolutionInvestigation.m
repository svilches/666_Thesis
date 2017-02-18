close all;

fgrin = 0.91; %(*[mm]*)
fobj = 7.5; %(*[mm]*)
Dcore = 0.0065; %(*[mm]*)

NAobj = 0.022;
lambda = 0.00133;

M = fgrin/fobj

% PSFcore
x = linspace(-500E-3,500E-3,1000); % [mm]
PSFcore=Gauss(x,1,0,Dcore/(4*M));
figure1 = figure();
plot(x,PSFcore)
title('PSFcore')
axis([-100E-3,100E-3,0,1])

MTFcore = abs(fft(PSFcore));
dx = (max(x)*2)/length(x);
k = linspace(-1/(2*dx),+1/(2*dx),length(PSFcore));
kTrans = k';
MTFcoreNorm = fftshift(MTFcore/max(MTFcore))';

figure2 = figure();
plot(kTrans,MTFcoreNorm)
title('MTF Core')
axis([0,50,0,1])

% MTFopt
MTFopt = microscopeMTF(k,NAobj,lambda);
figure3 = figure();
plot(kTrans,MTFopt)
title('MTF Optics')
axis([0,50,0,1])

% MTFsys
MTFsys = MTFopt.*MTFcoreNorm';
figure4 = figure();
plot(kTrans,MTFsys)
title('MTF System')
axis([0,50,0,1])

% MTFconf
MTFconf = conv(MTFsys,MTFsys);
MTFconf = MTFconf/max(MTFconf);
figure5 = figure();
plot(kTrans,MTFconf(501:1500))
title('MTF Conf')
axis([0,50,0,1])

MTFfullconf = conv(MTFopt,MTFopt);
MTFfullconf = MTFfullconf/max(MTFfullconf);
csvwrite('MTFfullconf.csv',(MTFfullconf(501:1500)'))

MTFexp = csvread('MTFexp.csv');

plot(kTrans,MTFcoreNorm,kTrans,MTFopt,kTrans,MTFsys,kTrans,MTFconf(501:1500),MTFexp(:,1),MTFexp(:,2))
legend('MTF core','MTF optics', 'Illumination MTF = Detection MTF', 'System PSF = Illumination*Detection', 'Experimental MTF')
axis([0,50,0,1])

