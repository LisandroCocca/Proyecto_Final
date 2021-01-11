function [trajectory,velocity,aceleration,tiempo]=rectilinear(Pi,Pf,tf,paso)

dist=sqrt((Pf(1,1)-Pi(1,1))^2+(Pf(2,1)-Pi(2,1))^2+(Pf(3,1)-Pi(3,1))^2);
qi=0;
qf=dist;
escala=1.5; % escala must be grater than one
a=(4*dist/tf^2)*escala;
tc=0.5*(tf-sqrt((tf^2*a-4*dist)/a));
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
p=Pi*ones(1,punti)+(Pf-Pi)/(dist)*s(1,:);
v=(Pf-Pi)/(dist)*sp(1,:);
ac=(Pf-Pi)/(dist)*spa(1,:);

% Final state
tf=1; % Final time in steady state
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
% figure,plot3(p(1,:),p(2,:),p(3,:)),xlim([-1 1]),ylim([-1 1]),zlim([0 2]), grid on, spazio_lavoro(30);
end