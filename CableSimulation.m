clear all
f=power(10,6);
% r=0.1:0.1:10;
% bsr=5*r;

 r=sqrt(10/pi);
 bsr=5;
f=0:10e4:15e6;

param=zeros(1,length(r));
for i=1:length(f)
    obj=CableClass(f(i),r,bsr);
%     if(obj.damping<50)
        param(i)=obj.decDamping;
%     end
end
plot(f,param)
min(param)
max(param)