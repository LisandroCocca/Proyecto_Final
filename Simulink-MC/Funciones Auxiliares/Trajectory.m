%% Operational Space Trajectorie - Path 
function [xref, dxref, ddxref, waypoints] = Trajectory()
addpath(genpath('Trayectorias')); % ADD TO PATH THE FOLDER Trayectorias
%Parameters;
pix=0;piy=0;piz=0;Pi=[pix;piy;piz]; % Intial Point
Q2=Pi;Q3=[3;0;0];Q4=[5;1;0];Q5=[6;2;0];Q6=[5;3;0]; 
pfx=1;pfy=0;pfz=0;Pf=[pfx;pfy;pfz]; % Final point

Q=[Pi Q2 Q3 Q4 Q5 Q6 Pf]; % Points
deltas=1.3*[1 1 1 1 1 1];
tf=18;
tref=[0 3 5 8 11 13 tf]; % Time associated with the points
paso=1e-3;
[trajectory,velocity,aceleration,t]=Path(Q,tref,deltas,paso);

% Angle
angle_xy=0.15*ones(1,length(trajectory(1,:)));
dangle_xy=zeros(1,length(trajectory(1,:)));
ddangle_xy=zeros(1,length(trajectory(1,:)));

moddx = sqrt(velocity(1,:).^2 + velocity(2,:).^2);
xref=[t;trajectory(1,:);trajectory(2,:);angle_xy]';
dxref=[t;velocity(1,:);velocity(2,:);moddx;dangle_xy]';
ddxref=[t;aceleration(1,:);aceleration(2,:);ddangle_xy]';

var.time = xref(:,1);
var.signals.values = [xref(:,2), xref(:,3), xref(:,4)];
waypoints = var.signals.values;

