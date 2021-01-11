function [trajectory,velocity,aceleration,tiempo]=circular(Pi,c,bheta,gamma,tf,thita1,thita2,paso)
c=c+Pi; % Center of the circle
r=sqrt((c(1,1)-Pi(1,1))^2+(c(2,1)-Pi(2,1))^2+(c(3,1)-Pi(3,1))^2);
Ry=[cos(bheta) 0 sin(bheta) ; 0 1 0 ; -sin(bheta) 0 cos(bheta)]; % Rotation by an angle bheta about y
Rx=[1 0 0 ; 0 cos(gamma) -sin(gamma) ; 0 sin(gamma) cos(gamma)]; % Rotation by an angle gamma about x

qi=thita1*r;
qf=thita2*r;
aux=1; % Regulates the trapezoidal profile. Must be >1
a=(4*(qf-qi)/tf^2)*aux;
tc=0.5*(tf-sqrt((tf^2*a-4*(qf-qi))/a));
punti=tf/paso+1;
s=zeros(1,punti);
sp=zeros(1,punti);
spa=zeros(1,punti);
for i=1:punti
    if i<=(tc/paso)
        s(i)=qi+0.5*a*(i*paso)^2;
        sp(i)=a*(i*paso);
        spa(i)=a;
    elseif i>(tc/paso) && i<=((tf-tc)/paso)
        s(i)=qi+a*tc*(i*paso-tc/2);
        sp(i)=a*tc;
        spa(i)=0;
    elseif i>((tf-tc)/paso) && i<=(tf/paso) 
        s(i)=qf-0.5*a*(tf-i*paso)^2;
        sp(i)=a*(tf-i*paso);
        spa(i)=-a;
    else
        s(i)=qf;
        sp(i)=0;
        spa(i)=0;
    end  
end
for i=1:punti
p(:,i)=c+Ry*Rx*[r*cos(s(1,i)/r) ; r*sin(s(1,i)/r) ; 0];
v(:,i)=Ry*Rx*[-sp(1,i)*sin(s(1,i)/r) ; sp(1,i)*cos(s(1,i)/r) ; 0];
ac(:,i)=Ry*Rx*[-sp(1,i)^2*cos(s(1,i)/r)/r-spa(1,i)*sin(s(1,i)/r) ; -sp(1,i)^2*sin(s(1,i)/r)/r+spa(1,i)*cos(s(1,i)/r) ; 0];
end

% Final state
tf=10; % Final time in steady state
p2=p(:,end)*ones(1,tf/paso);
v2=v(:,end)*ones(1,tf/paso);
ac2=ac(:,end)*ones(1,tf/paso);

% Total trajectory
trajectory=[p p2];
velocity=[v v2];
aceleration=[ac ac2 ];
L=length([p p2]);
tiempo=(0:L-1)*paso;
% tiempo=(0:punti-1)*paso;
% close all;
% figure,plot(tiempo,p(1,:),tiempo,v(1,:),tiempo,ac(1,:)), grid on,legend('x','v','a')
% figure,plot(tiempo,p(2,:),tiempo,v(2,:),tiempo,ac(2,:)), grid on,legend('x','v','a')
% figure,plot(tiempo,p(3,:),tiempo,v(3,:),tiempo,ac(3,:)), grid on,legend('x','v','a')
% figure,plot3(p(1,:),p(2,:),p(3,:)),xlim([-1 1]),ylim([-1 1]),zlim([0 2]),grid on, spazio_lavoro(30);
end