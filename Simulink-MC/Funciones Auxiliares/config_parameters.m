%% Aquí se establecen todos los datos necesarios para el robot
% Datos del vehículo
Auto.L = 0.275;                             % Distancia entre ejes
Auto.a2 = 0.100;                            % Distancia Rear - CM
Auto.a1 = Auto.L - Auto.a2;                 % Distancia Front - CM
Auto.h = 0.05;                              % Altura del CM
Auto.psi_max = 0.5;                         % Maximo ángulo de dirección
Auto.m = 2.2;                               % Masa del vehículo
Auto.Izz = 0.035677083;                     % Momento de inercia de un prisma de masa 5kg y lados 0.275m y 0.100m
Auto.Iyy = 0.01;
Auto.GR = 10.3;                                % Relación de transmisión
Auto.T1 = 0.100; % Trocha delantera [m]
Auto.b1d = 0.050; 
Auto.b1i = Auto.T1 - Auto.b1d; 
Auto.T2 = 0.100; % Trocha trasera [m]
Auto.b2d = 0.050; 
Auto.b2i = Auto.T2 - Auto.b2d; 
Auto.k_sus = 1000;
Auto.b_sus = 10;

% Datos de neumático
Neum.Rg = 0.06;
Neum.Jw = 0.00018;

Neum.sc = 0.75;
Neum.Calfa = 5;
Neum.muy = 1;
Neum.mu_s = 1;
Neum.low_v = 0.1;

% Datos del controlador
PP_Controller.kla = 0.5;
PP_Controller.la_low = 0.1;

PP_Controller.KP = 5;
PP_Controller.KI = 0.1;
PP_Controller.KD = 0;


