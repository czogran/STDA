
classdef CableClass
    properties
        %s – przekrój przewodu [mm2]
        s = 2.5;
        %dlugosc kabla [km]
        dlugosc=0.08;
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
        
        R %rezystancja
        C %pojemnoœæ
        L %induktancja
        G %konduktywnoœæ (przewodnoœæ w³aœciwa) przewodu [m/?mm2]
        
        %Rezystancja kilometryczna Rk [?/km]
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
        decDamping
    end
   methods
       function obj = CableClass(f, gk);
           
           obj.r = sqrt(obj.s/pi); %liczymy promieñ z za³o¿onego przekroju
           obj.bsr = 3*obj.r; %odleg³oœæ miêdzy ¿y³ami = 2r + izolacja
           obj.y=56;
           %obj.dlugosc=
           
           %przypisanie wartoœci z "konstruktora"
           obj.f=f;
           obj.Gk = gk;
           
           obj.w=2*pi*obj.f;
           
           %parametry jednostkowe
           obj.Rk=1000/obj.y/obj.s
           obj.Lk=2*log(obj.bsr/obj.r+0.5)*10^-4;
           obj.Xk=obj.w*obj.Lk; % reaktancja indukcyjna Xk [?/km] 
           obj.Ck=0.02415/log(obj.bsr/obj.r)*10^-6;
           obj.Bk = obj.w*obj.Ck;
           %obj.Gk = 0.001;

           %poprawka na d³ugoœæ linii
           obj.C=obj.Ck*obj.dlugosc;
           obj.L=obj.Lk*obj.dlugosc;
           obj.R=obj.Rk*obj.dlugosc;
           obj.G=obj.Gk*obj.dlugosc;
           
           %konduktancja=0 https://puss.pila.pl/uploads/dydaktyka/ip-lele-model-linii-elektr.pdf
           
           obj.lambda=sqrt((obj.R+j*obj.w*obj.L)*(obj.G+j*obj.w*obj.C));
           obj.damping=real(obj.lambda);
           obj.decDamping= obj.damping*8.685;
       end     
   end
end



