function [] = UnP_Case_III(Car_Data, Control_Data, Error_Data, ~, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
% Plot XY
FigI = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot (Ref_Data.XY(:,1),Ref_Data.XY(:,2),'Color',color,'LineStyle','--');
hold on
plot (Car_Data.Case_III.XY_2(:,1),Car_Data.Case_III.XY_2(:,2),'Color',color);
grid on

dim = [.17 .69 .24 .2];
str = sprintf("Position Error Metrics \nISE: %.1f \nIAE: %.1f \nITAE: %.1f \nITSE: %.1f",Error_Data.Case_III.tot_ISE,Error_Data.Case_III.tot_IAE,Error_Data.Case_III.tot_ITAE, Error_Data.Case_III.tot_ITSE);
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',12);
legend("RearD","RearV")
ylabel ('Y (m)','FontSize',12)
xlabel ('X (m)','FontSize',12);
title (['Case III - Modelos: ',Model_Data.Case_III.model_alias,' - Map: ',Map_Data.map_name],'FontSize',16)
axis equal;

saveas(FigI,[Plot_Data.figure_path_unique,'Mapa_',Map_Data.map_name],'png');
close

%% Plot de x(t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0 77 0]/255;
plot(Ref_Data.tout,Ref_Data.XY(:,1),'Color',color,'LineStyle','--');
hold on
plot (Ref_Data.tout,Car_Data.Case_III.XY_2(:,1),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_III.XY(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

dim = [.77 .69 .24 .2];
str = sprintf("ISE: %.1f \nIAE: %.1f \nITAE: %.1f \nITSE: %.1f",Error_Data.Case_III.ISE(1),Error_Data.Case_III.IAE(1),Error_Data.Case_III.ITAE(1), Error_Data.Case_III.ITSE(1));
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',12);
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
plot (Ref_Data.tout,Car_Data.Case_III.XY_2(:,2),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_III.XY(:,2),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

str = sprintf("ISE: %.1f \nIAE: %.1f \nITAE: %.1f \nITSE: %.1f",Error_Data.Case_III.ISE(2),Error_Data.Case_III.IAE(2),Error_Data.Case_III.ITAE(2), Error_Data.Case_III.ITSE(2));
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',12);
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
plot (Ref_Data.tout,Neum_Data.Case_III.V2(:,1),'Color',color);
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
plot(Ref_Data.tout,Error_Data.Case_III.V(:,1),'Color',color,'LineStyle',':','LineWidth',1.5);
grid on

str = sprintf("ISE: %.1f \nIAE: %.1f \nITAE: %.1f \nITSE: %.1f",Error_Data.Case_III.V_ISE,Error_Data.Case_III.V_IAE,Error_Data.Case_III.V_ITAE, Error_Data.Case_III.V_ITSE);
annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',12);
ylabel ('Error (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Speed Error",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'SpeedErr_',Map_Data.map_name],'png');
close

%% Plot de aceleracion (t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [189, 183, 107] / 255;
plot(Ref_Data.tout,Control_Data.Case_III.Fx_2,'Color',color);
grid on

ylabel ('a (m/s2)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear acceleration",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Acel_',Map_Data.map_name],'png');
close

%% Plot de delta(t)
FigII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [0, 0, 0] / 255;
plot(Ref_Data.tout,Control_Data.Case_III.delta_deg,'Color',color);
grid on

ylabel ('Psi (°)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Steering Angle",'FontSize',12)

saveas(FigII,[Plot_Data.figure_path_unique,'Delta_',Map_Data.map_name],'png');
close

%% Plots de neumaticos Front
% Fuerzas 
FigIII = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_III.Fneum1(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_III.Fneum1(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_III.Fneum1(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel('Forces (N)','FontSize',12)
xlabel('Time (s)','FontSize',12);
title("Front Rolling Forces",'FontSize',12)

saveas(FigIII,[Plot_Data.figure_path_unique,'NeumFront_Forces',Map_Data.map_name],'png');
close

%% Velocidades
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[102, 0, 204];
         [204, 51, 153]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_III.V1(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_III.V1(:,2),'Color',color(2,:));

legend("Vx","Vy",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front Tire Speed",'FontSize',12)

saveas(FigIV,[Plot_Data.figure_path_unique,'NeumFront_Speed',Map_Data.map_name],'png');
close

%% Alpha
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [204, 0, 0];     
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_III.Alpha1,'Color',color);
grid on

ylabel ('Alpha','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Front Alpha",'FontSize',12)

saveas(FigIV,[Plot_Data.figure_path_unique,'NeumFront_Alpha',Map_Data.map_name],'png');
close

%% Plots de neumaticos Rear
% Fuerzas 
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[51, 51, 204];
         [0, 153, 255];
         [0, 153, 153]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_III.Fneum2(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_III.Fneum2(:,2),'Color',color(2,:));
plot(Ref_Data.tout,Neum_Data.Case_III.Fneum2(:,3),'Color',color(3,:));

legend("F_x","F_y","F_z",'location','best')
ylabel('Forces (N)','FontSize',12)
xlabel('Time (s)','FontSize',12);
title("Rear Rolling Forces",'FontSize',12)

saveas(FigIV,[Plot_Data.figure_path_unique,'NeumRear_Forces',Map_Data.map_name],'png');
close

%% Velocidades
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [[102, 0, 204];
         [204, 51, 153]];
     
color = color ./ 255;
plot(Ref_Data.tout,Neum_Data.Case_III.V2(:,1),'Color',color(1,:));
hold on
grid on
plot(Ref_Data.tout,Neum_Data.Case_III.V2(:,2),'Color',color(2,:));

legend("Vx","Vy",'location','best')
ylabel ('Speed (m / s)','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear Tire Speed",'FontSize',12)

saveas(FigIV,[Plot_Data.figure_path_unique,'NeumRear_Speed',Map_Data.map_name],'png');
close

%% Alpha
FigIV = figure ('Units','normalized','OuterPosition',Plot_Data.Blockfig);
color = [204, 0, 0];     
color = color ./ 255;

plot(Ref_Data.tout,Neum_Data.Case_III.Alpha2,'Color',color);
grid on

ylabel ('Alpha','FontSize',12)
xlabel ('Time (s)','FontSize',12);
title ("Rear Alpha",'FontSize',12)

saveas(FigIV,[Plot_Data.figure_path_unique,'NeumRear_Alpha',Map_Data.map_name],'png');
close
