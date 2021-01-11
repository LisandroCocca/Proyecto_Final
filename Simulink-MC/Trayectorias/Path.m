function [trajectory,velocity,aceleration,tiempo]=path(Q,tref,deltas,paso)

DeltaT=1;
paso=1e-3;
tf=tref(end); % Final time
punti=tf/paso;
n=length(tref);
s=zeros(n-1,punti); % Position vector
sp=zeros(n-1,punti); % Velocity vector
spa=zeros(n-1,punti); % Aceleration vector
p=Q(:,1)*ones(1,punti); % Trajectory
v=zeros(3,punti); % Velocity
ac=zeros(3,punti); % Aceleration
for j=1:n-1
dist=sqrt((Q(1,j+1)-Q(1,j))^2+(Q(2,j+1)-Q(2,j))^2+(Q(3,j+1)-Q(3,j))^2);
qi=0;
qf=dist;
tf=tref(j+1)-tref(j);
escala=1;% Escala must be greater or equal than one
a=(4*(qf-qi)/tf^2)*escala;
tc=0.5*(tf-sqrt((tf^2*a-4*(qf-qi))/a));
for i=1:punti
    if i<=tref(j)/paso
        s(j,i)=0;
    elseif i>tref(j)/paso && i<tref(j+1)/paso
        if i<=(tc+tref(j))/paso
            s(j,i)=qi+0.5*a*(i*paso-tref(j))^2;
            sp(j,i)=a*(i*paso-tref(j));
            spa(j,i)=a;
        elseif i>(tc+tref(j))/paso && i<=((tf-tc+tref(j))/paso)
            s(j,i)=qi+a*tc*(i*paso-tref(j)-tc/2);
            sp(j,i)=a*tc;
            spa(j,i)=0;
        else
            s(j,i)=qf-0.5*a*(tf-i*paso+tref(j))^2;
            sp(j,i)=a*(tf-i*paso+tref(j));
            spa(j,i)=-a;
        end  
    else
        s(j,i)=dist;
        sp(j,i)=0;
        spa(j,i)=0;
    end
end
if dist==0
        p=[0;0;0]*[s(j,DeltaT:punti-1) s(j,punti)*ones(1,DeltaT)]+p;
        v=[0;0;0]*[sp(j,DeltaT:punti-1) sp(j,punti)*ones(1,DeltaT)]+v;
        ac=[0;0;0]*[spa(j,DeltaT:punti-1) spa(j,punti)*ones(1,DeltaT)]+ac;
        DeltaT=DeltaT+deltas(j)/paso;
    else
        p=(Q(:,j+1)-Q(:,j))/(dist)*[s(j,DeltaT:punti-1) s(j,punti)*ones(1,DeltaT)]+p;
        v=(Q(:,j+1)-Q(:,j))/(dist)*[sp(j,DeltaT:punti-1) sp(j,punti)*ones(1,DeltaT)]+v;
        ac=(Q(:,j+1)-Q(:,j))/(dist)*[spa(j,DeltaT:punti-1) spa(j,punti)*ones(1,DeltaT)]+ac;
        DeltaT=DeltaT+deltas(j)/paso;
end
end

% Final state
tf=5; % FINAL TIME IN STEADY STATE
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
% figure,plot3(p(1,:),p(2,:),p(3,:)),xlim([-1 1]),ylim([-1 1]),zlim([0
% 2]),grid on, spazio_lavoro(30);
end