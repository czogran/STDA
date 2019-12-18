
classdef CableClass
    properties
        %s � przekr�j przewodu [mm2]
        s = 2.5;
        %dlugosc kabla [km]
        dlugosc;
        % r- promie� przewodu [mm]
        r
        % f-czestotliwosc
        f
        % w � pulsacja pr�du [rd/s];
        w %=2*pi*f;
        % bsr- sredni odst�p pomiedzy przewodami [mm]
        bsr;
        % mied� mi�kka: ? = 56 m/?mm2
        y;
        
        %Rezystancja kilometryczna Rk [Ohm/km]
        Rk
        % Lk � indukcyjno�� jednostkowa (kilometryczna) linii [H/km]; 
        Lk
        % kilometryczna pojemno�� robocza linii [F/km];  
        Ck
        % Konduktancja Gk [S/km]
        Gk
        % lambda- sta�a propagacji
        lambda
        %czesc rzeczywista z lambdy - [db/km]       
        damping
        %t�umienie na ko�cu linii w dB
        endDamping
    end
   methods
       function obj = CableClass(f, gk, L);
           
           obj.r = sqrt(obj.s/pi); %liczymy promie� z za�o�onego przekroju
           obj.bsr = 3*obj.r; %odleg�o�� mi�dzy �y�ami = 2r + izolacja
           obj.y=56;
           
           %przypisanie warto�ci z "konstruktora"
           obj.f=f;
           obj.dlugosc=L;
           obj.Gk = gk;
           
           obj.w=2*pi*obj.f;
           
           %parametry jednostkowe
           obj.Rk=1000/(obj.y*obj.s);
           obj.Lk=2*log(obj.bsr/obj.r+0.5)*10^-4;
           obj.Ck=10^-6*0.02415/log10(obj.bsr/obj.r);
           
           %konduktancja=0 https://puss.pila.pl/uploads/dydaktyka/ip-lele-model-linii-elektr.pdf
           
           obj.lambda=sqrt((obj.Rk+j*obj.w*obj.Lk)*(obj.Gk+j*obj.w*obj.Ck));
           obj.damping=real(obj.lambda)*8.685;
           obj.endDamping= obj.damping * obj.dlugosc;
       end     
   end
end



