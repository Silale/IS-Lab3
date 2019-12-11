x = 0.1:1/22:1; % vienas iejimas
y = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;% vienas isejimas
q = 0.15;%mokymosi zingsnis
c1 = 0.19;% centro reiksme
c2 = 0.87;% centro reiksme
r1 = 0.1;% spindulio reiksme
r2 = 0.1;% spindulio reiksme... sitass reiksmes ir mokymo zingsni keitinejau kol gavau geriausia varianta
w1 = randn(1);
w2 = randn(1);
w0 = randn(1);


for j=1:10000% praleidziu tiek kartu iteracija kiek irasau cia
    for i = 1:20% cikla pakuriau kad paskaiciuotu su 20  reiksmiu
        F1 = exp(-(x(i)-c1)^2/(2*r1^2));%gauso funcija
        F2 = exp(-(x(i)-c2)^2/(2*r2^2));
        y1 = F1*w1+F2*w2+w0;%dauginu is  svoriu
        e = y(i)-y1;
        w1 = w1+q*e*x(i);%svoriu atnaujinimas
        w2 = w2+q*e*x(i);
        w0 = w0+q*e*1;
    end
disp(e)
end
Y = zeros (20,1);
for i = 1:20
    F1 = exp(-(x(i)-c1)^2/(2*r1^2));
    F2 = exp(-(x(i)-c2)^2/(2*r2^2));
    y1 = F1*w1+F2*w2+w0;
    
    Y(i) = y1;
end
plot(x,d,'ko',x,Y,'r*')
    
        