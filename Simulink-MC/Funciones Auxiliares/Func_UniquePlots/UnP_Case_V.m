function [] = UnP_Case_V(Car_Data, Control_Data, Error_Data, ~, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
% Plot XY
FigI = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot (Ref_Data.XY(:,1),Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Car_Data.Case_V.XY_2(:,1),Car_Data.Case_V.XY_2(:,2),'Color',color);
grid on

legend("RearD","RearV")
ylabel ('Y (m)','FontSize',12)
xlabel ('X (m)','FontSize',12);
title (['Case V - Modelos: ',Model_Data.Case_V.model_alias,' - Map: ',Map_Data.map_name],'FontSize',16)
axis equal;

saveas(FigI,[Plot_Data.figure_path_unique,'Mapa_',Map_Data.map_name],'png');
close

%% Plot de x(t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,1),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_V.XY_2(:,1),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('X (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("X Coordinate",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'PosX_',Map_Data.map_name],'png');
close

%% Plot de error de x (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot(Ref_Data.tout,Error_Data.Case_V.XY(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

ylabel ('Error (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Position Error - X",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'ErrorX_',Map_Data.map_name],'png');
close

%% Plot de y(t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 0 255]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_V.XY_2(:,2),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('Y (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Y Coordinate",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'PosY_',Map_Data.map_name],'png');
close

%% Plot de error en y (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 0 255]/255;
plot(Ref_Data.tout,Error_Data.Case_V.XY(:,2),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

ylabel ('Error (m)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Position Error - Y",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'ErrorY_',Map_Data.map_name],'png');
close

%% Plot de speed (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [221, 117, 28] / 255;
plot(Ref_Data.tout,Ref_Data.V(:,3),'Color',color','LineStyle','--');
hold on
plot (Ref_Data.tout,Neum_Data.Case_V.V2(:,1),'Color',color);
grid on

legend("RearD","RearV",'location','best')
ylabel ('Speed (m/s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear speed",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Speed_',Map_Data.map_name],'png');
close

%% Plot de error speed (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [179 107 0]/255;
plot(Ref_Data.tout,Error_Data.Case_V.V(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

ylabel ('Error (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Speed Error",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'SpeedErr_',Map_Data.map_name],'png');
close

%% Plot de torque (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [189, 183, 107] / 255;
plot(Ref_Data.tout,Control_Data.Case_V.Mu_2,'Color',color);
grid on

ylabel ('M (Nm)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Engine Output Torque",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Torque_',Map_Data.map_name],'png');
close

%% Plot de delta (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0, 0, 0] / 255;
plot(Ref_Data.tout,Control_Data.Case_V.delta_deg,'Color',color);
grid on

ylabel ('Psi (°)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Steering Angle",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Delta_',Map_Data.map_name],'png');
close

%% Plot Neumáticos 
% Fila 1
% Fuerzas Front-Left
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIII,[Plot_Data.figure_path_mp,'Neums_F1_Left_',Map_Data.map_name],'png');

% Velocidades Front-Left
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIII,[Plot_Data.figure_path_mp,'Neums_V1_Left_',Map_Data.map_name],'png');

% Slips Front
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIII,[Plot_Data.figure_path_mp,'Neums_Slips1_',Map_Data.map_name],'png');

%% Fila 2
% Fuerzas Front-Right
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIII,[Plot_Data.figure_path_mp,'Neums_F1_Right_',Map_Data.map_name],'png');

% Velocidades longitudinales Front-Right
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIII,[Plot_Data.figure_path_mp,'Neums_V1_Right_',Map_Data.map_name],'png');

% Alphas Front
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIII,[Plot_Data.figure_path_mp,'Neums_Alphas1',Map_Data.map_name],'png');

%% Plots Rear Neums
% Fila 1
% Fuerzas Rear-Left
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIV,[Plot_Data.figure_path_mp,'Neums_F2_Left',Map_Data.map_name],'png');

% Velocidades Rear-Left
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIV,[Plot_Data.figure_path_mp,'Neums_V2_Left',Map_Data.map_name],'png');

% Slips Rear
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIV,[Plot_Data.figure_path_mp,'Neums_Slips2',Map_Data.map_name],'png');

%% Fila 2
% Fuerzas Rear-Right
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIV,[Plot_Data.figure_path_mp,'Neums_F2_Right',Map_Data.map_name],'png');

% Velocidades longitudinales Rear-Right
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIV,[Plot_Data.figure_path_mp,'Neums_V2_Right',Map_Data.map_name],'png');

% Alphas Rear-Right
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
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

saveas(FigIV,[Plot_Data.figure_path_mp,'Neums_Alphas2',Map_Data.map_name],'png');
close all


