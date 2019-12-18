
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
        % reaktancja indukcyjna Xk [?/km] 
        Xk
        % kilometryczna pojemnoœæ robocza linii [F/km];  
        Ck
        %  Susceptancja Bk [S/km]
        Bk
        % Konduktancja Gk [S/km]
        Gk
        % lambda- sta³a propagacji
        lambda
        %czesc rzeczywista z lambdy         
        damping
        %t³umienie w dB
        endDamping
    end
   methods
       function obj = CableClass(f, gk, l);
           
           obj.r = sqrt(obj.s/pi); %liczymy promieñ z za³o¿onego przekroju
           obj.bsr = 3*obj.r; %odleg³oœæ miêdzy ¿y³ami = 2r + izolacja
           obj.y=56;
           obj.dlugosc=l;
           
           %przypisanie wartoœci z "konstruktora"
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



