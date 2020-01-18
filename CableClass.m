
classdef CableClass
    properties
        %s – przekrój przewodu [mm2]
        s = 2.5;
        %dlugosc kabla [km]
        dlugosc;
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
        
        %punkt 0
        lower
        %asymptota
        higher
    end
   methods
       function obj = CableClass(f, gk, L, Rk);
           
           obj.r = sqrt(obj.s/pi); %liczymy promieñ z za³o¿onego przekroju
           obj.bsr = 3*obj.r; %odleg³oœæ miêdzy ¿y³ami = 2r + izolacja
           obj.y=56;
           
           %przypisanie wartoœci z "konstruktora"
           obj.f=f;
           obj.dlugosc=L;
           obj.Gk = gk;
           
           obj.w=2*pi*obj.f;
           
           %parametry jednostkowe
           obj.Rk=1000/(obj.y*obj.s);
           obj.Lk=2*log(obj.bsr/obj.r+0.5)*10^-4;
           obj.Ck=10^-6*0.02415/log10(obj.bsr/obj.r);
           
           %lower = sqrt(obj.Rk*obj.Gk)*8.685 %dolna granica t³umienia w dB/km
           %higher = (obj.Rk*obj.Ck + obj.Gk*obj.Lk)/(2*sqrt(obj.Lk*obj.Ck))*8.685 %asymptota, górna granica t³umienia
           
           %konduktancja=0 https://puss.pila.pl/uploads/dydaktyka/ip-lele-model-linii-elektr.pdf
           obj.Rk = Rk;
           obj.lambda=sqrt((obj.Rk+j*obj.w*obj.Lk)*(obj.Gk+j*obj.w*obj.Ck));
           obj.damping=real(obj.lambda)*8.685;
           obj.endDamping= obj.damping * obj.dlugosc;
       end     
   end
end



