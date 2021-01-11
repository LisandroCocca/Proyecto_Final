function [] = MP_Case_IV(Car_Data, Control_Data, Error_Data, ~ , Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
% Plot XY
FigI = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot (Ref_Data.XY(:,1),Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Car_Data.Case_VI.XY_2(:,1),Car_Data.Case_VI.XY_2(:,2),'Color',color);
grid on

legend("RearD","RearV")
ylabel ('Y (m)','FontSize',12)
xlabel ('X (m)','FontSize',12);
title (['Case IV - Modelos: ',Model_Data.Case_VI.model_alias,' - Map: ',Map_Data.map_name],'FontSize',16)
axis equal;
saveas(FigI,[Plot_Data.figure_path_mp,'Mapa_',Map_Data.map_name],'png');

%% Plot multiple (8 in 1)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);

%% Plot de x(t)
subplot(2,4,1)
color = [0 77 0]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,1),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_VI.XY_2(:,1),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('X (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("X Coordinate",'FontSize',12)

%% Plot de error de x (t)
subplot(2,4,5)
color = [0 77 0]/255;
plot(Ref_Data.tout,Error_Data.Case_VI.XY(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

ylabel ('Error (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Position Error - X",'FontSize',12)

%% Plot de y(t)
subplot(2,4,2)
color = [0 0 255]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_VI.XY_2(:,2),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('Y (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Y Coordinate",'FontSize',12)

%% Plot de error en y (t)
subplot(2,4,6)
color = [0 0 255]/255;
plot(Ref_Data.tout,Error_Data.Case_VI.XY(:,2),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

ylabel ('Error (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Position Error - Y",'FontSize',12)

%% Plot de speed (t)
subplot(2,4,3)
color = [221, 117, 28] / 255;
plot(Ref_Data.tout,Ref_Data.V(:,3),'Color',color','LineStyle','--');
hold on
plot (Ref_Data.tout,Neum_Data.Case_VI.V2(:,1),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('Speed (m/s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear speed",'FontSize',12)

%% Plot de error speed (t)
subplot(2,4,7)
color = [179 107 0]/255;
plot(Ref_Data.tout,Error_Data.Case_VI.V(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

ylabel ('Error (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Speed Error",'FontSize',12)

%% Plot de torque (t)
subplot(2,4,4)
color = [189, 183, 107] / 255;
plot(Ref_Data.tout,Control_Data.Case_VI.Mu_2,'Color',color);
grid on

ylabel ('M (Nm)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Engine Output Torque",'FontSize',12)

%% Plot de delta (t)
subplot(2,4,8)
color = [0, 0, 0] / 255;
plot(Ref_Data.tout,Control_Data.Case_VI.delta_deg,'Color',color);
grid on

ylabel ('Delta (°)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Steering Angle",'FontSize',12)

suptitle (['Case IV - Modelos: ',Model_Data.Case_VI.model_alias,' - Map: ',Map_Data.map_name])
saveas(FigII,[Plot_Data.figure_path_mp,'Multiplot_',Map_Data.map_name],'png');

%% Plot Neumáticos 
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);

%% Fila 1
% Fuerzas Front
subplot(2,3,1)
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];

color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_VI.Fneum1(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_VI.Fneum1(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_VI.Fneum1(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel ('XY Forces (N)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front Rolling Forces",'FontSize',12)

% Velocidades Front
subplot(2,3,2)
color = [[102, 0, 204];
         [204, 51, 153];
         [0,  204, 102]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_VI.V1(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_VI.V1(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_VI.Rg*Neum_Data.Case_VI.Wneum1,'Color',color(3,:));

legend("Vx","Vy","W*Rg",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front Tire Speeds",'FontSize',12)

% Slips
subplot(2,3,3)
color = [[0, 0, 0];[204, 204, 0]];
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_VI.Slip1,'Color',color(1,:));
grid on
hold on
plot(Ref_Data.tout,Neum_Data.Case_VI.Slip2,'Color',color(2,:));

legend("Front","Rear",'location','best')
ylabel ('Slip','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Slip Value",'FontSize',12)


%% Fila 2
% Fuerzas XY 
subplot(2,3,4)
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];

color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_VI.Fneum2(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_VI.Fneum2(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_VI.Fneum2(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel ('Tire Forces (N)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear Rolling Forces",'FontSize',12)

% Velocidades longitudinales
subplot(2,3,5)
color = [[102, 0, 204];
         [204, 51, 153];
         [0,  204, 102]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_VI.V2(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_VI.V2(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_VI.Rg*Neum_Data.Case_VI.Wneum2,'Color',color(3,:));

legend("Vx","Vy","W*Rg",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear Tire Speed",'FontSize',12)

% Alphas
subplot(2,3,6)
color = [[204, 0, 0];[230, 138, 0]];     
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_VI.Alpha1,'Color',color(1,:));
grid on
hold on
plot(Ref_Data.tout,Neum_Data.Case_VI.Alpha2,'Color',color(2,:));

legend("Front","Rear",'location','best')
ylabel ('Alpha','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Alpha Coefficient",'FontSize',12)

suptitle (['Case IV - Tire Variables - Map: ',Map_Data.map_name])
saveas(FigIII,[Plot_Data.figure_path_mp,'Neum_',Map_Data.map_name],'png');

%% Nueva Data
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);

subplot(3,1,1)
plot(Ref_Data.tout, Car_Data.Case_VI.PSI_CM * 180/pi());

subplot(3,1,2)
plot(Ref_Data.tout, Car_Data.Case_VI.Z_CM);

subplot(3,1,3)
plot(Ref_Data.tout, Car_Data.Case_VI.omega_psi);

