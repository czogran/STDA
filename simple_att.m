L = 0.1 %d�ugo�� w km

 f1 = 0*1000; %pocz�tek charakterystyki [Hz]
 f2 = 300*1000; %koniec [Hz]
 fd = 10*1000; %odst�py [Hz]
 
f=f1:fd:f2; %macierz cz�stotliwo�ci

tmp = 1:length(f)
for i = tmp
    damping(i) = att(f(i)).*L;
end
plot(f, damping);