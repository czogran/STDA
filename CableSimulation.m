clear all

 f1 = 50*1000; %pocz�tek charakterystyki [Hz]
 f2 = 300*1000; %koniec [Hz]
 fd = 10*1000 %odst�py [Hz]
 
f=f1:fd:f2; %macierz cz�stotliwo�ci



param=zeros(1,length(f)); %t�umienie jednostkowe
param2=zeros(1,length(f)); %t�umienie na ko�cu linii
for i=1:length(f)
    
    obj=CableClass(f(i), 2.78, 0.108); %tu sobie manipulujemy Gk i d�. linii (f, Gk, L)
    param(i)=obj.damping;
    param2(i)=obj.endDamping;
    
end

plot(f,param)
xlim([f1-fd/2, f2+fd/2]);
ylabel("T�umienie [dB/km]");
xlabel("Cz�stotliwo�� [Hz]");
%yline(3, '--r'); 

title("T�umienie jednostkowe");

figure(2)
plot(f,param2)
%title('T�umienie na ko�cu linii');
title(max(param2)-min(param2)); %zakres zmienno�ci t�umienia
xlim([f1-fd/2, f2+fd/2]);
ylabel("T�umienie [dB]");
xlabel("Cz�stotliwo�� [Hz]");
yline(3, '--r');
xline(50, '--g')


