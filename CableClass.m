
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
        % reaktancja indukcyjna Xk [?/km] 
        Xk
        % kilometryczna pojemno�� robocza linii [F/km];  
        Ck
        %  Susceptancja Bk [S/km]
        Bk
        % Konduktancja Gk [S/km]
        Gk
        % lambda- sta�a propagacji
        lambda
        %czesc rzeczywista z lambdy         
        damping
        %t�umienie w dB
        endDamping
    end
   methods
       function obj = CableClass(f, gk, l);
           
           obj.r = sqrt(obj.s/pi); %liczymy promie� z za�o�onego przekroju
           obj.bsr = 3*obj.r; %odleg�o�� mi�dzy �y�ami = 2r + izolacja
           obj.y=56;
           obj.dlugosc=l;
           
           %przypisanie warto�ci z "konstruktora"
           obj.f=f;
           obj.Gk = gk;
           
           obj.w=2*pi*obj.f;
           
           %parametry jednostkowe
           obj.Rk=1000/(obj.y*obj.s);
           obj.Lk=2*log(obj.bsr/obj.r+0.5)*10^-4;
           obj.Xk=obj.w*obj.Lk; % reaktancja indukcyjna Xk [?/km] 
           obj.Ck=0.02415/log(obj.bsr/obj.r)*10^-6;
           obj.Bk = obj.w*obj.Ck;
           
           %konduktancja=0 https://puss.pila.pl/uploads/dydaktyka/ip-lele-model-linii-elektr.pdf
           
           obj.lambda=sqrt((obj.Rk+j*obj.w*obj.Lk)*(obj.Gk+j*obj.w*obj.Ck));
           obj.damping=real(obj.lambda)*8.685;
           obj.endDamping= obj.damping * obj.dlugosc;
       end     
   end
end



