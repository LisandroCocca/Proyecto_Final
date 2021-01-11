function [] = UnP_Case_IV(Car_Data, Control_Data, Error_Data, ~, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
% Plot XY
FigI = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot (Ref_Data.XY(:,1),Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Car_Data.Case_IV.XY_2(:,1),Car_Data.Case_IV.XY_2(:,2),'Color',color);
grid on

legend("RearD","RearV")
ylabel ('Y (m)','FontSize',12)
xlabel ('X (m)','FontSize',12);
title (['Case IV - Modelos: ',Model_Data.Case_IV.model_alias,' - Map: ',Map_Data.map_name],'FontSize',16)
axis equal;

saveas(FigI,[Plot_Data.figure_path_unique,'Mapa_',Map_Data.map_name],'png');
close

%% Plot de x(t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,1),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_IV.XY_2(:,1),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_IV.XY(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
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
plot (Ref_Data.tout,Car_Data.Case_IV.XY_2(:,2),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_IV.XY(:,2),'Color',color,'LineStyle',':','LineWidth',1.5);
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
plot (Ref_Data.tout,Neum_Data.Case_IV.V2(:,1),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_IV.V(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

ylabel ('Error (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Speed Error",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'SpeedErr_',Map_Data.map_name],'png');
close

%% Plot de torque (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [189, 183, 107] / 255;
plot(Ref_Data.tout,Control_Data.Case_IV.Mu_2,'Color',color);
grid on

ylabel ('M (Nm)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Engine Output Torque",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Torque_',Map_Data.map_name],'png');
close

%% Plot de psi (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0, 0, 0] / 255;
plot(Ref_Data.tout,Control_Data.Case_IV.delta_deg,'Color',color);
grid on

ylabel ('Psi (�)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Steering Angle",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Delta_',Map_Data.map_name],'png');
close

%% Plot Neum�ticos 
% Fila 1
% Fuerzas Front
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];

color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_IV.Fneum1(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_IV.Fneum1(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_IV.Fneum1(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel ('XY Forces (N)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front Rolling Forces",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Neum_F1_',Map_Data.map_name],'png');
close

%% Velocidades Front
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[102, 0, 204];
         [204, 51, 153];
         [0,  204, 102]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_IV.V1(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_IV.V1(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_IV.Rg*Neum_Data.Case_IV.Wneum1,'Color',color(3,:));

legend("Vx","Vy","W*Rg",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front Tire Speeds",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Neum_V1_',Map_Data.map_name],'png');
close

%% Slips
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[0, 0, 0];[204, 204, 0]];
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_IV.Slip1,'Color',color(1,:));
grid on
hold on
plot(Ref_Data.tout,Neum_Data.Case_IV.Slip2,'Color',color(2,:));

legend("Front","Rear",'location','best')
ylabel ('Slip','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Slip Value",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Slips_',Map_Data.map_name],'png');
close

%% Fila 2
% Fuerzas XY 
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];

color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_IV.Fneum2(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_IV.Fneum2(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_IV.Fneum2(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel ('Tire Forces (N)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear Rolling Forces",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Neum_F2_',Map_Data.map_name],'png');
close

%% Velocidades longitudinales
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[102, 0, 204];
         [204, 51, 153];
         [0,  204, 102]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_IV.V2(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_IV.V2(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_IV.Rg*Neum_Data.Case_IV.Wneum2,'Color',color(3,:));

legend("Vx","Vy","W*Rg",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear Tire Speed",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Neum_V2_',Map_Data.map_name],'png');
close

%% Alphas
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[204, 0, 0];[230, 138, 0]];     
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_IV.Alpha1,'Color',color(1,:));
grid on
hold on
plot(Ref_Data.tout,Neum_Data.Case_IV.Alpha2,'Color',color(2,:));

legend("Front","Rear",'location','best')
ylabel ('Alpha','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Alpha Coefficient",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Alphas_',Map_Data.map_name],'png');
close