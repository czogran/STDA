L = 0.1 %d³ugoœæ w km

 f1 = 0*1000; %pocz¹tek charakterystyki [Hz]
 f2 = 300*1000; %koniec [Hz]
 fd = 10*1000; %odstêpy [Hz]
 
f=f1:fd:f2; %macierz czêstotliwoœci

tmp = 1:length(f)
for i = tmp
    damping(i) = att(f(i)).*L;
end
plot(f, damping);