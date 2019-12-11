
classdef CableClass
    properties
        % �r�d�o http://www.przemyslawtabaka.info/materialy/EL_EN_CW/param_linii.pdf
        
        % r- promie� przewodu [mm]
        r=1;
        
        % f-czestotliwosc
        f =power(10,6);
        
        % w � pulsacja pr�du [rd/s];
        w%=2*pi*f;
       
        % bsr- sredni odst�p pomiedzy przewodami [mm]
        bsr%=4*r;
        
        %  konduktywno�� (przewodno�� w�a�ciwa) przewodu [m/?mm2]
       
        % mied� mi�kka: ? = 56 m/?mm2
        y;
       
        %  s � przekr�j przewodu
        s
        %  Rezystancja kilometryczna Rk [?/km]
        Rk

        %dlugosc- jak d�ugi kabel 
        dlugosc=0.1;
        %rezystancja
        R
        %pojemno��
        C
        %induktancja
        L

        % Lk � indukcyjno�� jednostkowa (kilometryczna) linii [H/km]; 
        Lk

        % reaktancja indukcyjna Xk [?/km] 
         Xk
         
        % kilometryczna pojemno�� robocza linii [F/km];  
         Ck
         
        %  Susceptancja Bk [S/km]
        Bk
        
        % lambda- sta�a propagacji
        lambda
        
        %czesc rzeczywista z lambdy         
        damping
        
        decDamping
    end
   methods
       function obj = CableClass(f,r,bsr);
           obj.y=56;
           obj.dlugosc=0.1;
           
           obj.bsr=bsr;
           obj.r=r;
           obj.f=f;
           
           obj.w=2*pi*obj.f;
           obj.s=power(obj.r,2)*pi
           obj. Rk=1000/obj.y/obj.s

           
           obj.R=obj.Rk*obj.dlugosc;
           obj.Lk=2*log(obj.bsr/obj.r+0.5)*10^-4;

           % reaktancja indukcyjna Xk [?/km] 
           obj.Xk=obj.w*obj.Lk;

           obj.Ck=0.02415/log(obj.bsr/obj.r)*10^-6;
     
           obj.Bk = obj.w*obj.Ck;

           obj.C=obj.Ck*obj.dlugosc
           obj.L=obj.Lk*obj.dlugosc
%            obj.lambda=sqrt((obj.R+j*obj.w*obj.Lk)*(1/obj.R+j*obj.w*obj.Ck))
           % konduktancja=0 https://puss.pila.pl/uploads/dydaktyka/ip-lele-model-linii-elektr.pdf
           
           obj.lambda=sqrt((obj.R+j*obj.w*obj.L)*(0.001+j*obj.w*obj.C))
           obj.damping=real(obj.lambda)
           % obj.decDamping=10;
            obj.decDamping= obj.damping*8.685
       end     
   end
end


