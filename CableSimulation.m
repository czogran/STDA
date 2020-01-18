clear all;
close all;

 f1 = 50*1000; %pocz�tek charakterystyki [Hz]
 f2 = 9E6; %koniec [Hz]
 fd = 10*1000; %odst�py [Hz]
 
f=f1:fd:f2; %macierz cz�stotliwo�ci

L = 0.0115; %d�ugo�� linii
Rk =45; %ohm/km linii

param=zeros(1,length(f)); %t�umienie jednostkowe
param2=zeros(1,length(f)); %t�umienie na ko�cu linii
for i=1:length(f)
    
    obj=CableClass(f(i), 1.2, L, Rk); %tu sobie manipulujemy Gk i d�. linii (f, Gk, L, Rk)
    param(i)=obj.damping;
    param2(i)=obj.endDamping;
    
end

%t�umienie wg. �r�de�
tmp = 1:length(f);
for i = tmp
    damping(i) = att(f(i)).*L;
    damping_km(i) = att(f(i));
end

% plot(f,param)
% hold on;
% %t�umienie wg. �r�de�
% plot(f, damping_km);
% xlim([f1-fd/2, f2+fd/2]);
% ylabel("T�umienie [dB/km]");
% xlabel("Cz�stotliwo�� [Hz]");
% %yline(3, '--r'); 
% title("T�umienie jednostkowe");
% legend('T�umienie wg. teorii linii d�ugiej','T�umienie wg. �r�de�');


figure(2)
plot(f,param2) %t�umienie wg. linii d�ugiej
hold on;
%t�umienie wg. �r�de�
plot(f, damping);

title('T�umienie na ko�cu linii o d�ugo�ci 11.5m');
%title(max(param2)-min(param2)); %zakres zmienno�ci t�umienia
xlim([f1-fd/2, f2+fd/2]);
ylabel("T�umienie [dB]");
xlabel("Cz�stotliwo�� [Hz]");
yline(damping(1)+3, '--r');
xline(8E6, '--g');
legend('T�umienie wg. teorii linii d�ugiej', 'T�umienie wg. �r�de�', 'Spadek 3dB', '8 MHz');
%legend('T�umienie wg. �r�de�', 'Spadek 3dB');

