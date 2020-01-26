close all;
clear all;
% C - przep�ywno�� kana�u w bit/s

B = 7E6; %pasmo w Hz

snr = (-10):1:60;  %zakres zmienno�ci t�umienia
snr_lin = 10.^(snr./10);

C = B*log2(snr_lin+1);

%zyski kodowe w zale�no�ci od warto�ciowo�ci modulacji
zysk4 = log2(4);
zysk8 = log2(8);
zysk16 = log2(16);
zysk64 = log2(64);

plot(snr, C);
hold on;
% plot(snr, C/zysk4);
% plot(snr, C/zysk8);
% plot(snr, C/zysk16);
% plot(snr, C/zysk64);

title('Przepływność kanału o paśmie 7 MHz');
ylabel("Przepływność [bit/s]");
xlabel("SNR [dB]");
yline(1E8, '--r'); %100 Mb/s
%legend('Brak zysku modulacji', 'Modulacja 4-warto�ciowa', '8-wart.', '16-wart.', '64-wart.', '100Mb/s');
legend('Przepływność','100Mb/s');
