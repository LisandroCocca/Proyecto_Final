function Model_Data = model_config()
%% Lista de modelos de simulación
Model_Data = {};
Cases = ["Case_I"; "Case_II"; "Case_III"];

% Creo las estructuras
for i=1:length(Cases)
    Model_Data.(char(Cases(i))).model_alias = '';
    Model_Data.(char(Cases(i))).simu_name = "";
    Model_Data.(char(Cases(i))).planner_type = 0;
    Model_Data.(char(Cases(i))).planner_name = "";
    Model_Data.(char(Cases(i))).controller_type = 0;
    Model_Data.(char(Cases(i))).controller_name = "";
    Model_Data.(char(Cases(i))).vehicle_type = 0;
    Model_Data.(char(Cases(i))).vehicle_name = "";
end

%% Case I
Model_Data.Case_I.model_alias = 'C1 / D1 / G1';
Model_Data.Case_I.simu_name = "Simu_LC_Case_I.slx";
Model_Data.Case_I.planner_type = 1;
Model_Data.Case_I.planner_name = "Simple";
Model_Data.Case_I.controller_type = 1;
Model_Data.Case_I.controller_name = "Pure Pursuit + PID";
Model_Data.Case_I.vehicle_type = 1;
Model_Data.Case_I.vehicle_name = "Bicicleta Cinemática";

%% Case II
Model_Data.Case_II.model_alias = 'C1 / D1 / G2';
Model_Data.Case_II.simu_name = "Simu_LC_Case_II.slx";
Model_Data.Case_II.planner_type = 1;
Model_Data.Case_II.planner_name = "Simple";
Model_Data.Case_II.controller_type = 1;
Model_Data.Case_II.controller_name = "Pure Pursuit + PID";
Model_Data.Case_II.vehicle_type = 2;
Model_Data.Case_II.vehicle_name = "Bicicleta SemiDinámica";

%% Case III
Model_Data.Case_III.model_alias = 'C1 / D1 / G3';
Model_Data.Case_III.simu_name = "Simu_LC_Case_III.slx";
Model_Data.Case_III.planner_type = 1;
Model_Data.Case_III.planner_name = "Simple";
Model_Data.Case_III.controller_type = 1;
Model_Data.Case_III.controller_name = "Pure Pursuit + PID";
Model_Data.Case_III.vehicle_type = 3;
Model_Data.Case_III.vehicle_name = "Bicicleta Dinámica";

%% Case IV
Model_Data.Case_IV.model_alias = 'C1 / D1 / G4';
Model_Data.Case_IV.simu_name = "Simu_LC_Case_IV.slx";
Model_Data.Case_IV.planner_type = 1;
Model_Data.Case_IV.planner_name = "Simple";
Model_Data.Case_IV.controller_type = 1;
Model_Data.Case_IV.controller_name = "Pure Pursuit + PID";
Model_Data.Case_IV.vehicle_type = 4;
Model_Data.Case_IV.vehicle_name = "Bicicleta Dinámica + Inercia Neumáticos";

%% Case V
Model_Data.Case_V.model_alias = 'C1 / D1 / G5';
Model_Data.Case_V.simu_name = "Simu_LC_Case_V.slx";
Model_Data.Case_V.planner_type = 1;
Model_Data.Case_V.planner_name = "Simple";
Model_Data.Case_V.controller_type = 1;
Model_Data.Case_V.controller_name = "Pure Pursuit + PID";
Model_Data.Case_V.vehicle_type = 4;
Model_Data.Case_V.vehicle_name = "Auto sin suspensión";

%% Case VI
Model_Data.Case_VI.model_alias = 'C1 / D1 / G6';
Model_Data.Case_VI.simu_name = "Simu_LC_Case_VI.slx";
Model_Data.Case_VI.planner_type = 1;
Model_Data.Case_VI.planner_name = "Simple";
Model_Data.Case_VI.controller_type = 1;
Model_Data.Case_VI.controller_name = "Pure Pursuit + PID";
Model_Data.Case_VI.vehicle_type = 4;
Model_Data.Case_VI.vehicle_name = "Bicicleta Dinámica c/Suspensión";



