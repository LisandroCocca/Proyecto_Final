%% Modo manual o automatico
function [] = plot_routine(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Neum_Data, Plot_Data, Ref_Data)

% Seteo el path para el guardado de gráficas
Plot_Data.figure_path_mp = [pwd,'\Graficas\',Global_Data.case,'\'];
Plot_Data.figure_path_unique = [Plot_Data.figure_path_mp,'UniquePlots\'];

% Defino un tamano uniforme de figura
Plot_Data.Blockfig = [0.1 0.1 0.8 0.8];

%% Switch para realizacion de plots
switch Plot_Data.plot_config
    % Se muestra los 8 plots de interes comprimidos en 1
    case "Multiplot"
        switch Global_Data.case
            case "Case_I"
                MP_Case_I(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data)
            case "Case_II"
                MP_Case_II(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data)
            case "Case_III"
                MP_Case_III(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
            case "Case_IV"
                MP_Case_IV(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
            case "Case_V"
                MP_Case_V(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
            case "Case_VI"
                MP_Case_VI(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
            otherwise
                fprintf('No se conoce la rutina de ploteo Multiplot: %s\n',Global_Data.case)
        end
        
    case "Save_Only"
        switch Global_Data.case
            case "Case_I"
                UnP_Case_I(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data)
            case "Case_II"
                UnP_Case_II(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data)
            case "Case_III"
                UnP_Case_III(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
            case "Case_IV"
                UnP_Case_IV(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
            case "Case_V"
                UnP_Case_V(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)
            case "Case_VI"
                UnP_Case_VI(Car_Data, Control_Data, Error_Data, Global_Data, Map_Data, Model_Data, Plot_Data, Ref_Data, Neum_Data)  
            otherwise
                fprintf('No se conoce la rutina de ploteo Save_Only: %s\n',Global_Data.case)
        end
        
    case ""
        msgbox("Ningún Plot ha sido seleccionado!")
        
end

