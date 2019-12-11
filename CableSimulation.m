clear all

 f1 = 50*1000; %pocz�tek charakterystyki [Hz]
 f2 = 3000*1000; %koniec [Hz]
 fd = 50*1000 %odst�py [Hz]
 
f=f1:fd:f2; %macierz cz�stotliwo�ci



param=zeros(1,length(f));
for i=1:length(f)
    
    obj=CableClass(f(i), 0.0534); %tu sobie manipulujemy Gk
    param(i)=obj.decDamping;
    
end

plot(f,param)
xlim([f1-fd/2, f2+fd/2]);
%xticks(f);
ylabel("T�umienie [dB]");
xlabel("Cz�stotliwo�� [Hz]");
yline(3, '--r'); 

%zakres zmienno�ci t�umienia
max(param)-min(param)
title(max(param)-min(param));

