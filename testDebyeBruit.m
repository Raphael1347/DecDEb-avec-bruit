clear
clc
close all

f=logspace(-3,4,100);

w=f.*(2*pi);

%t=logspace(floor(log10(min(1./w))-1), ceil(log10(max(1./w))+1), 1000).';

t=logspace(-5,6,1101).';

[ Z,Zr,Zi,Zo ] = debye( w );

rng(42);

fprintf('Tau\t\t\t\t  mk\n')
fprintf('----------------------------\n')

i=0;
for sigma=0:0.01:0.1;
i=i+1;
bruit=1+normrnd(0,sigma,1,numel(Z));

% Zbruitamp=bruit.*abs(Z);
Zbruit=bruit.*Z;


[ mk(i,:),t,Zinv] = DecDebyeEtZinv( Zbruit,t,w,Zo );

% err1=abs(0.75-mk(101))./0.75;
% err2=abs(0.25-mk(401))./0.25;

% fprintf('%10.6f\t%10.6f\t%10.6f\n',sigma,err1,err2)

%  figure(i)
% Zinvamp=abs(Zinv);
% Zbruit2=abs(Zbruit);
% 
% semilogx(w,Zbruit2,'x',w,Zinvamp);
% legend('bruit','inv','model')

Err2=(abs((Z-Zinv)./Zinv)).^2;
figure(i)
semilogx(w,Err2)

axis([10^-4 10^6 0 10^-2]);
end

% pos=find(mk);
% 
% fprintf('Tau\t\t\t\t  mk\n')
% fprintf('----------------------------\n')
% 
% for i=1:numel(pos)
% 
% fprintf('%10.6e\t%10.6f\n',t(pos(i)),mk(pos(i)))
% 
% end