%wszystkie czêstotliwoœci w Hz.
function y = att(f)
    if f < 100000 
        y = 100; %100 db/km
    else 
        %dodatkowe 0.25 dB/km na ka¿dy kHz powy¿ej 100kHz:
        ft = f - 100E3;
        ft = ft ./ 1000; %f w kHz
        add_y = ft.*0.25; % +0.25dB/kHz
        y = add_y + 100;
    end
end

