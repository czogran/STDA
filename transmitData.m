% DATA FOR SIMULINK trasnmitFullSim

SNR = 23 %SNR in dB. Used in the noise generator

Nbps=4; %N bits per symbol
Ts = 1e-8 %"Sample time"

symbolsMulti=5500; % ???

% amount of errors after which transsmison stops
tgtMaxErr=100 000;

%DATA FOR RLCG TRANSMISSION LINE

% Resistance per length (ohms/m):
Rpr=45e-3;
% Inductance per length (H/m):
Ipr=2.5055e-7;
% Capacitance per length (F/m):
Cappr=5.0616e-11;
% Conductance per length (S/m):
Conpr=1.2e-3
% Frequency (Hz):
freq=8e6;
% Transmission line length (m):
length=11.5;