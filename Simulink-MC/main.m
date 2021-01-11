%% Limpieza del workspace inicial
addpath(genpath(pwd))
% clearvars -except Global_Data Model_Data Map_Data Neum_Data Car_Data Control_Data waypoints xref dxref ddxref

%% Cargo los modelos disponibles
Model_Data = model_config();

%% Configuración de la variable de datos globales
% El modo manual se creo para testear sin hacerle preguntas al usuario
Global_Data = {};
Global_Data.mode = "manual";
Global_Data.step_size = 0.001;

%% Creacion del mapa
% Por el momento se corre esta linea para evitar problemas con los spline
[xref, dxref, ddxref, waypoints] = Trajectory();

% Creacion de un mapa utilizando splines
Map_Data = create_map(Global_Data);

%% Simulación
% Datos para pasar como input al Simulink
run config_parameters

% Selección del caso de simulación
Global_Data.case = 'Case_VI';

% Bandera para detectar errores
Global_Data.flag = true;
try
    % Corre la simulacion definida por el caso en cuestión
     sim(Model_Data.(Global_Data.case).simu_name)
catch e
    Global_Data.flag = false;
    fprintf(1,'The identifier was:\n%s\n',e.identifier);
    fprintf(1,'There was an error! The message was:\n%s\n',e.message);
    error_var = lasterror;
    stack_var = dbstack ;
    exception_var = getReport(e,'extended') ;
    uiwait(errordlg("Error en la simulación"))
end

%% Ploteo
% Guardo los output de Simulink dentro de las estructuras:
%   - Ref_Data: Datos asociados a la referencia, sampleados con el simuTime
%   - Car_Data: Componentes relacionadas al movimiento del vehículo en los distintos sistemas
%   - Control_Data: Valores de las variables de control
%   - Neum_Data: Información referente a la dinámica de los nuemáticos
run config_plots

% Seleccionar entre MultiPlot y Save_Only
% - Multiplot: Se arman multiples subplot y se muestran en pantalla
% - Save_Only: Se arman solo gráficas individuales y se guardan
% directamente
%Plot_Data.plot_config = "Save_Only";
Plot_Data.plot_config = "Multiplot";

try
    plot_routine(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Neum_Data, Plot_Data, Ref_Data);
% catch
%     Global_Data.flag = false;
%     uiwait(errordlg("Error en la rutina de plots"))
end

%% Final del programa
if Global_Data.flag
    myicon = imread('smiley.jpg');
    uiwait(msgbox('Program Completed!','Success','custom',myicon));
    winopen([pwd,'\Graficas\',Global_Data.case])
end
