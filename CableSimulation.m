clear all
close all
clc
 f1 = 50*1000; %pocz¹tek charakterystyki [Hz]
 f2 = 3000*1000; %koniec [Hz]
 fd = 10*1000 %odstêpy [Hz]
 
f=f1:fd:f2; %macierz czêstotliwoœci



param=zeros(1,length(f)); %t³umienie jednostkowe
param2=zeros(1,length(f)); %t³umienie na koñcu linii
for i=1:length(f)
    
    obj=CableClass(f(i), 0, 0.1); %tu sobie manipulujemy Gk i d³. linii (f, Gk, L)
    param(i)=obj.damping;
    param2(i)=obj.endDamping;
    
end

figure
plot(f,param)
xlim([f1-fd/2, f2+fd/2]);
ylabel("T³umienie [dB/km]");
xlabel("Czêstotliwoœæ [Hz]");
%yline(3, '--r'); 
title("T³umienie jednostkowe");
hold off

figure(2)
plot(f,param2)
hold on
%title('T³umienie na koñcu linii');
title(max(param2)-min(param2)); %zakres zmiennoœci t³umienia
xlim([f1-fd/2, f2+fd/2]);
ylabel("T³umienie [dB]");
xlabel("Czêstotliwoœæ [Hz]");
yline(3, '--r');
hold on
xline(50, '--g');
hold off


