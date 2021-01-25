function [] = MP_Case_V(Car_Data, Control_Data, Error_Data, ~ , Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
% Plot XY
FigI = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot (Ref_Data.XY(:,1),Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Car_Data.Case_V.XY_2(:,1),Car_Data.Case_V.XY_2(:,2),'Color',color);
grid on

dim = [.175 .69 .24 .2];
str = sprintf("Position Error Metrics \nISE: %.1f \nIAE: %.1f \nITAE: %.1f \nITSE: %.1f",Error_Data.Case_V.tot_ISE,Error_Data.Case_V.tot_IAE,Error_Data.Case_V.tot_ITAE, Error_Data.Case_V.tot_ITSE);
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',12);
legend("RearD","RearV")
ylabel ('Y (m)','FontSize',12)
xlabel ('X (m)','FontSize',12);
title (['Case V - Modelos: ',Model_Data.Case_V.model_alias,' - Map: ',Map_Data.map_name],'FontSize',16)
axis equal;
saveas(FigI,[Plot_Data.figure_path_mp,'Mapa_',Map_Data.map_name],'png');

%% Plot multiple (8 in 1)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);

%% Plot de x(t)
subplot(2,4,1)
color = [0 77 0]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,1),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_V.XY_2(:,1),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('X (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("X Coordinate",'FontSize',12)

%% Plot de error de x (t)
subplot(2,4,5)
color = [0 77 0]/255;
plot(Ref_Data.tout,Error_Data.Case_V.XY(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

dim = [.135 .22 .2 .2];
str = sprintf("ISE: %.1f \nIAE: %.1f \nITAE: %.1f \nITSE: %.1f",Error_Data.Case_V.ISE(1),Error_Data.Case_V.IAE(1),Error_Data.Case_V.ITAE(1), Error_Data.Case_V.ITSE(1));
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);
ylabel ('Error (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Position Error - X",'FontSize',12)

%% Plot de y(t)
subplot(2,4,2)
color = [0 0 255]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_V.XY_2(:,2),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('Y (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Y Coordinate",'FontSize',12)

%% Plot de error en y (t)
subplot(2,4,6)
color = [0 0 255]/255;
plot(Ref_Data.tout,Error_Data.Case_V.XY(:,2),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

dim = [.34 .22 .2 .2];
str = sprintf("ISE: %.1f \nIAE: %.1f \nITAE: %.1f \nITSE: %.1f",Error_Data.Case_V.ISE(2),Error_Data.Case_V.IAE(2),Error_Data.Case_V.ITAE(2), Error_Data.Case_V.ITSE(2));
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);
ylabel ('Error (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Position Error - Y",'FontSize',12)

%% Plot de speed (t)
subplot(2,4,3)
color = [221, 117, 28] / 255;
plot(Ref_Data.tout,Ref_Data.V(:,3),'Color',color','LineStyle','--');
hold on
plot (Ref_Data.tout,Neum_Data.Case_V.V2(:,1),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('Speed (m/s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear speed",'FontSize',12)

%% Plot de error speed (t)
subplot(2,4,7)
color = [179 107 0]/255;
plot(Ref_Data.tout,Error_Data.Case_V.V(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

dim = [.545 .22 .2 .2];
str = sprintf("ISE: %.1f \nIAE: %.1f \nITAE: %.1f \nITSE: %.1f",Error_Data.Case_V.V_ISE,Error_Data.Case_V.V_IAE,Error_Data.Case_V.V_ITAE, Error_Data.Case_V.V_ITSE);
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);
ylabel ('Error (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Speed Error",'FontSize',12)

%% Plot de torque (t)
subplot(2,4,4)
color = [189, 183, 107] / 255;
plot(Ref_Data.tout,Control_Data.Case_V.Mu_2,'Color',color);
grid on

ylabel ('M (Nm)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Engine Output Torque",'FontSize',12)

%% Plot de delta (t)
subplot(2,4,8)
color = [0, 0, 0] / 255;
plot(Ref_Data.tout,Control_Data.Case_V.delta_deg,'Color',color);
grid on

ylabel ('Delta (°)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Steering Angle",'FontSize',12)

suptitle (['Case V - Modelos: ',Model_Data.Case_V.model_alias,' - Map: ',Map_Data.map_name])
saveas(FigII,[Plot_Data.figure_path_mp,'Multiplot_',Map_Data.map_name],'png');

%% Plot Neumáticos 
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);

%% Fila 1
% Fuerzas Front-Left
subplot(2,3,1)
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];

color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum1_I(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum1_I(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum1_I(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel ('Tire Forces (N)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front-Left Rolling Forces",'FontSize',12)

% Velocidades Front-Left
subplot(2,3,2)
color = [[102, 0, 204];
         [204, 51, 153];
         [0,  204, 102]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_V.V1_I(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_V.V1_I(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_V.Rg*Neum_Data.Case_V.Wneum1_I,'Color',color(3,:));

legend("Vx","Vy","W*Rg",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front-Left Tire Speeds",'FontSize',12)

% Slips Front
subplot(2,3,3)
color = [[0, 0, 0];[204, 204, 0]];
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_V.Slip1_I,'Color',color(1,:));
grid on
hold on
plot(Ref_Data.tout,Neum_Data.Case_V.Slip1_D,'Color',color(2,:));

legend("Left","Right",'location','best')
ylabel ('Slips','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front Slip Values",'FontSize',12)


%% Fila 2
% Fuerzas Front-Right
subplot(2,3,4)
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];

color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum1_D(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum1_D(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum1_D(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel ('Tire Forces (N)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front-Right Rolling Forces",'FontSize',12)

% Velocidades longitudinales Front-Right
subplot(2,3,5)
color = [[102, 0, 204];
         [204, 51, 153];
         [0,  204, 102]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_V.V1_D(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_V.V1_D(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_V.Rg*Neum_Data.Case_V.Wneum1_D,'Color',color(3,:));

legend("Vx","Vy","W*Rg",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front-Right Tire Speeds",'FontSize',12)

% Alphas Front
subplot(2,3,6)
color = [[204, 0, 0];[230, 138, 0]];     
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_V.Alpha1_I,'Color',color(1,:));
grid on
hold on
plot(Ref_Data.tout,Neum_Data.Case_V.Alpha1_D,'Color',color(2,:));

legend("Left","Right",'location','best')
ylabel ('Alphas','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front Alpha Coefficients",'FontSize',12)

suptitle (['Case V - Front Tire Variables - Map: ',Map_Data.map_name])
saveas(FigIII,[Plot_Data.figure_path_mp,'Neums_Front_',Map_Data.map_name],'png');


%% Plots Rear Neums
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);

%% Fila 1
% Fuerzas Rear-Left
subplot(2,3,1)
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];

color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum2_I(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum2_I(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum2_I(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel ('Tire Forces (N)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear-Left Rolling Forces",'FontSize',12)

% Velocidades Rear-Left
subplot(2,3,2)
color = [[102, 0, 204];
         [204, 51, 153];
         [0,  204, 102]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_V.V2_I(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_V.V2_I(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_V.Rg*Neum_Data.Case_V.Wneum2_I,'Color',color(3,:));

legend("Vx","Vy","W*Rg",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear-Left Tire Speeds",'FontSize',12)

% Slips Rear
subplot(2,3,3)
color = [[0, 0, 0];[204, 204, 0]];
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_V.Slip2_I,'Color',color(1,:));
grid on
hold on
plot(Ref_Data.tout,Neum_Data.Case_V.Slip2_D,'Color',color(2,:));

legend("Left","Right",'location','best')
ylabel ('Slips','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear Slip Values",'FontSize',12)


%% Fila 2
% Fuerzas Rear-Right
subplot(2,3,4)
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];

color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum2_D(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum2_D(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_V.Fneum2_D(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel ('Tire Forces (N)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear-Right Rolling Forces",'FontSize',12)

% Velocidades longitudinales Rear-Right
subplot(2,3,5)
color = [[102, 0, 204];
         [204, 51, 153];
         [0,  204, 102]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_V.V2_D(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_V.V2_D(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_V.Rg*Neum_Data.Case_V.Wneum2_D,'Color',color(3,:));

legend("Vx","Vy","W*Rg",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear-Right Tire Speeds",'FontSize',12)

% Alphas Rear-Right
subplot(2,3,6)
color = [[204, 0, 0];[230, 138, 0]];     
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_V.Alpha2_I,'Color',color(1,:));
grid on
hold on
plot(Ref_Data.tout,Neum_Data.Case_V.Alpha2_D,'Color',color(2,:));

legend("Left","Right",'location','best')
ylabel ('Alphas','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear Alpha Coefficients",'FontSize',12)

suptitle (['Case V - Rear Tire Variables - Map: ',Map_Data.map_name])
saveas(FigIII,[Plot_Data.figure_path_mp,'Neums_Rear_',Map_Data.map_name],'png');