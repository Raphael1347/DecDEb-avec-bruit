function [ Z,Zr,Zi,Z0 ] = debye( w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Z0=1000;

m1=0.25;
m2=0.75;

t1=10.^-2;
t2=10.^-5;

z1=m1.*(1-1./(1+(1i.*w.*t1)));

z2=m2.*(1-1./(1+(1i.*w.*t2)));


Z=Z0.*(1-z1-z2);

Zr=real(Z);
Zi=imag(Z);

Zn=(Z0-Z)./Z0; %normalisation de Z
Znr=real(Zn);
Zni=imag(Zn);

end