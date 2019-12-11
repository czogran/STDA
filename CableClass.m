
classdef CableClass
    properties
        %s � przekr�j przewodu [mm2]
        s = 2.5;
        %dlugosc kabla [km]
        dlugosc=0.08;
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
        
        R %rezystancja
        C %pojemno��
        L %induktancja
        G %konduktywno�� (przewodno�� w�a�ciwa) przewodu [m/?mm2]
        
        %Rezystancja kilometryczna Rk [?/km]
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
        decDamping
    end
   methods
       function obj = CableClass(f, gk);
           
           obj.r = sqrt(obj.s/pi); %liczymy promie� z za�o�onego przekroju
           obj.bsr = 3*obj.r; %odleg�o�� mi�dzy �y�ami = 2r + izolacja
           obj.y=56;
           %obj.dlugosc=
           
           %przypisanie warto�ci z "konstruktora"
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

           %poprawka na d�ugo�� linii
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



