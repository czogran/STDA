close all;
clear all;
% C - przep³ywnoœæ kana³u w bit/s

B = 8E6; %pasmo w Hz

snr = (-10):1:40;  %zakres zmiennoœci t³umienia
snr_lin = 10.^(snr./10);

C = B*log2(snr_lin+1);

%zyski kodowe w zale¿noœci od wartoœciowoœci modulacji
zysk4 = log2(4);
zysk8 = log2(8);
zysk16 = log2(16);
zysk64 = log2(64);

plot(snr, C);
hold on;
plot(snr, C*zysk4);
plot(snr, C*zysk8);
plot(snr, C*zysk16);
plot(snr, C*zysk64);

title('Przep³ywnoœæ kana³u o paœmie 8 MHz');
ylabel("Przep³ywnoœæ [bit/s]");
xlabel("SNR [dB]");
yline(1E8, '--r'); %100 Mb/s
legend('Brak zysku modulacji', 'Modulacja 4-wartoœciowa', '8-wart.', '16-wart.', '64-wart.', '100Mb/s');
