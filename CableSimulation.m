clear all;
close all;

 f1 = 50*1000; %pocz¹tek charakterystyki [Hz]
 f2 = 7E6; %koniec [Hz]
 fd = 10*1000 %odstêpy [Hz]
 
f=f1:fd:f2; %macierz czêstotliwoœci

L = 0.0115; %d³ugoœæ linii

param=zeros(1,length(f)); %t³umienie jednostkowe
param2=zeros(1,length(f)); %t³umienie na koñcu linii
for i=1:length(f)
    
    obj=CableClass(f(i), 1.3, L); %tu sobie manipulujemy Gk i d³. linii (f, Gk, L)
    param(i)=obj.damping;
    param2(i)=obj.endDamping;
    
end

if(false)
plot(f,param)
xlim([f1-fd/2, f2+fd/2]);
ylabel("T³umienie [dB/km]");
xlabel("Czêstotliwoœæ [Hz]");
%yline(3, '--r'); 
title("T³umienie jednostkowe");
end


figure(2)
plot(f,param2) %t³umienie wg. linii d³ugiej
hold on;
%t³umienie wg. Ÿróde³
tmp = 1:length(f);
for i = tmp
    damping(i) = att(f(i)).*L;
end
plot(f, damping);

title('T³umienie na koñcu linii o d³ugoœci 11.5m');
%title(max(param2)-min(param2)); %zakres zmiennoœci t³umienia
xlim([f1-fd/2, f2+fd/2]);
ylabel("T³umienie [dB]");
xlabel("Czêstotliwoœæ [Hz]");
yline(damping(1)+3, '--r');
xline(4E6, '--dg');
legend('T³umienie wg. teorii linii d³ugiej', 'T³umienie wg. Ÿróde³', 'Spadek 3dB', '4 MHz');
%legend('T³umienie wg. Ÿróde³', 'Spadek 3dB');



