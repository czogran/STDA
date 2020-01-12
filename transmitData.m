% DATA FOR SIMULINK trasnmitFullSim
EbN0=100 %35; the bigger the better
freqOffset=1000;
Nbps=8;
symbolsMulti=5500;
phaseNoise=-1000;%-76; the smaller the better
% amount of errors after which transsmison stops
tgtMaxErr=1000000;

%DATA FOR RLCG TRANSMISSION LINE
% Resistance per length (ohms/m):
Rpr=7.1429e-3;
% Inductance per length (H/m):
Ipr=2.5055e-7;
% Capacitance per length (F/m):
Cappr=5.0616e-11;
% Conductance per length (S/m):
Conpr=2.78e-3
% Frequency (Hz):
freq=4e6;
% Transmission line length (m):
length=0.1;