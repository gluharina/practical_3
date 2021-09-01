function pr3
y=[0 15];
[y,X]=ode45(@Func,y,[4; 2]);
plot(y,X(:,1), y,X(:,2));
title('«Хищник-жертва» с аддитивным управлением по хищникам');
legend('Жертвы','Хищники');
disp(['Жертв:     ' num2str(X(length(X)-1, 1))]);
disp(['Хищников: ' num2str(X(length(X)-1, 2))]);
disp(['Коэффициент р:   ' num2str(X(length(X)-1, 1)/X(length(X)-1, 2))]);
end 
 
function out=Func(~,x)
a1 = 0.1;
a2 = 0.4;
b1 = 0.4;
b2 = 0.05;
T = 1;
p = 2;
 
u = -a1.*x(1) + b1.*x(1).*x(2)- p.*a2.*x(2) + p.*b2.*x(1).*x(2) - ((x(1)-p.*x(2))/(T));
 
f1 = (a1.*x(1)-b1.*x(1).*x(2)+ u);
f2 = (-a2.*x(2)+b2.*x(1).*x(2));
 
out = [f1;f2];
end
