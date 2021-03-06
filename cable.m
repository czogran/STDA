clear all
clc
close all

data=1:53;
% f-czestotliwosc
f=power(10,6);
% w � pulsacja pr�du [rd/s];
w=2*pi*f;
% r- promie� przewodu [mm]
r=1;

% bsr- sredni odst�p pomiedzy przewodami [mm]
bsr=5*r;

%  Rezystancja kilometryczna Rk [?/km]
%  konduktywno�� (przewodno�� w�a�ciwa) przewodu [m/?mm2]
%  s � przekr�j przewodu
% mied� mi�kka: ? = 56 m/?mm2
y=56;

s=pow2(r)*pi
Rk=1000/y/s

%dlugosc- jak d�ugi kabel 
dlugosc=0.1;

R=Rk*dlugosc;

% Lk � indukcyjno�� jednostkowa (kilometryczna) linii [H/km]; 
Lk=2*log(bsr/r+0.5)*10^-4;
 
% reaktancja indukcyjna Xk [?/km] 
 Xk=w*Lk;

 Ck=0.02415/log(bsr/r)*10^-6;
%  Susceptancja Bk [S/km]
Bk = w*Ck;

% lambda- sta�a propagacji

lambda=sqrt((R+j*w*Lk)*(1/R+j*w*Ck))
tlumienie=real(lambda)

