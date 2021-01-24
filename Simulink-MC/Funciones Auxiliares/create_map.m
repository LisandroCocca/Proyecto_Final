function Map_Data = create_map(Global_Data)

% Lectura de los CSV disponibles
files = dir([pwd,'\Waypoints\*.csv']);
file_names = {files.name};

% Selección de mapa por parte del usuario
if Global_Data.mode == "manual"
    indx = 5;
else
    [indx,~] = listdlg('PromptString',{'Select a file.',...
        'Only one file can be selected at a time.',''},...
        'SelectionMode','single','ListString',file_names,'ListSize',[700,300]);
end

% Ruta del mapa
map_path = [files(indx).folder,'\',files(indx).name];
Map_Data.map_name = files(indx).name(1:end-4);


% Lectura de los waypoints
y = table2array(readtable(map_path));
y(:, [1 3]) = y(:, [3 1]);
y(:, [2 3]) = y(:, [3 2]);


%% Ajuste con splines
% Refinamiento del time vector
t_vector = y(1,1):Global_Data.step_size:y(end,1);

% Creacion de los coeficientes para los polinomios
tck_x = spline(y(:,1),y(:,2));
tck_y = spline(y(:,1),y(:,3));

% Splines de posición
new_x = ppval(t_vector,tck_x);
new_y = ppval(t_vector,tck_y);
dy = diff(new_x);
dx = diff(new_y);
new_theta = atan2(dy,dx);
new_theta = [new_theta(1),new_theta];

% Splines de velocidad
tck_vx = fnder(tck_x,1);
tck_vy = fnder(tck_y,1);

new_vx = ppval(t_vector,tck_vx);
new_vy = ppval(t_vector,tck_vy);
new_speed = sqrt(new_vx.^2 + new_vy.^2);
dangle_xy=zeros(1,length(t_vector));

% Variables de salida
Map_Data.pose_desired = [t_vector; new_x; new_y; new_theta]';
Map_Data.speed_desired = [t_vector; new_vx; new_vy; new_speed; dangle_xy]';
Map_Data.map_waypoints = Map_Data.pose_desired(:,2:4);
Map_Data.simu_time = t_vector(end);
