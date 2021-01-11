function [] = UnP_Case_I(Car_Data, Control_Data, Error_Data, ~, Map_Data, Model_Data, Plot_Data, Ref_Data)
% Plot XY
FigI = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot (Ref_Data.XY(:,1),Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Car_Data.Case_I.XY_2(:,1),Car_Data.Case_I.XY_2(:,2),'Color',color);
grid on

legend("RearD","RearV")
ylabel ('Y (m)','FontSize',12)
xlabel ('X (m)','FontSize',12);
title (['Case I - Modelos: ',Model_Data.Case_I.model_alias,' - Map: ',Map_Data.map_name],'FontSize',16)
axis equal;

saveas(FigI,[Plot_Data.figure_path_unique,'Mapa_',Map_Data.map_name],'png');
close

%% Plot de x(t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,1),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_I.XY_2(:,1),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_I.XY(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
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
plot (Ref_Data.tout,Car_Data.Case_I.XY_2(:,2),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_I.XY(:,2),'Color',color,'LineStyle',':','LineWidth',1.5);
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
plot (Ref_Data.tout,Car_Data.Case_I.V_2_2(:,1),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_I.V(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

ylabel ('Error (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Speed Error",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'SpeedErr_',Map_Data.map_name],'png');
close

%% Plot de aceleracion (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [189, 183, 107] / 255;
plot(Ref_Data.tout,Control_Data.Case_I.ax_2,'Color',color);
grid on

ylabel ('a (m/s2)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear acceleration",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Acel_',Map_Data.map_name],'png');
close

%% Plot de delta(t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0, 0, 0] / 255;
plot(Ref_Data.tout,Control_Data.Case_I.delta_deg,'Color',color);
grid on

ylabel ('Psi (°)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Steering Angle",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Delta_',Map_Data.map_name],'png');
close
