% source: http://www.przemyslawtabaka.info/materialy/EL_EN_CW/param_linii.pdf
classdef CableClass
    properties
        %s – przekrój przewodu [mm2]
        s = 2.5;
        %d³ugoœæ kabla [km]
        length;
        % r- promieñ przewodu [mm]
        r
        % f-czestotliwosc
        f
        % w – pulsacja pr¹du [rd/s];
        w %=2*pi*f;
        % bsr- sredni odstêp pomiedzy przewodami [mm]
        bsr;
        % miedŸ miêkka: ? = 56 m/?mm2
        y;
        
        %Rezystancja kilometryczna Rk [Ohm/km]
        Rk
        % Lk – indukcyjnoœæ jednostkowa (kilometryczna) linii [H/km]; 
        Lk
        % kilometryczna pojemnoœæ robocza linii [F/km];  
        Ck
        % Konduktancja Gk [S/km]
        Gk
        % lambda- sta³a propagacji
        lambda
        %czesc rzeczywista z lambdy - [db/km]       
        damping
        %t³umienie na koñcu linii w dB
        endDamping
    end
   methods
       function obj = CableClass(f, gk, L);
           
           obj.r = sqrt(obj.s/pi); %liczymy promieñ z za³o¿onego przekroju
           obj.bsr = 3*obj.r; %odleg³oœæ miêdzy ¿y³ami = 2r + izolacja
           obj.y=56;
           
           %przypisanie wartoœci z "konstruktora"
           obj.f=f;
           obj.length=L;
%            https://sound.eti.pg.gda.pl/~landos/Laboratorium_SA/_LabSAcw_06.pdf
%            6.35
           obj.Gk = 2.9e-13*obj.f*1000;
           
           obj.w=2*pi*obj.f;
           
           %parametry jednostkowe
           obj.Rk=1000/(obj.y*obj.s);
           obj.Lk=2*log(obj.bsr/obj.r+0.5)*10^-4;
           obj.Ck=10^-6*0.02415/log10(obj.bsr/obj.r);
           
           %konduktancja=0 https://puss.pila.pl/uploads/dydaktyka/ip-lele-model-linii-elektr.pdf
           
           obj.lambda=sqrt((obj.Rk+j*obj.w*obj.Lk)*(obj.Gk+j*obj.w*obj.Ck));
           obj.damping=real(obj.lambda)*8.685;
           obj.endDamping= obj.damping * obj.length
       end     
   end
end



