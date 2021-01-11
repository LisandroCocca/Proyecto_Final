%% Ordeno las estructuras de manera adecuada
Ref_Data.XY = pose_desired_out;
Ref_Data.V = speed_desired_out;
Ref_Data.tout = tout;

switch Global_Data.case
    case "Case_I"
        Neum_Data = {};
        
        Control_Data.Case_I.ax_2 = ax_2;
        Control_Data.Case_I.delta = delta;
        Control_Data.Case_I.delta_deg = rad2deg(Control_Data.Case_I.delta);
        
        Car_Data.Case_I.XY_2 = Mov_Vehicle_2(:,1:2);
        Car_Data.Case_I.V_2_0= Mov_Vehicle_2(:,3:4);
        Car_Data.Case_I.Theta = theta;
        Car_Data.Case_I.V_2_2= vx_2;
        
        Error_Data.Case_I.XY = Ref_Data.XY(:,1:2) - Car_Data.Case_I.XY_2;
        Error_Data.Case_I.V = Ref_Data.V(:,3) - Car_Data.Case_I.V_2_2(:,1);
        
    case "Case_II"
        Neum_Data = {};
        
        Control_Data.Case_II.Fx_2 = Fx_2;
        Control_Data.Case_II.delta = delta;
        Control_Data.Case_II.delta_deg = rad2deg(Control_Data.Case_II.delta);
        
        Car_Data.Case_II.XY_2 = Mov_Vehicle_2(:,1:2);
        Car_Data.Case_II.V_2 = Mov_Vehicle_2(:,3:4);
        Car_Data.Case_II.Theta = theta;
        Car_Data.Case_II.V_2_2= vx_2;
        
        Error_Data.Case_II.XY = Ref_Data.XY(:,1:2) - Car_Data.Case_II.XY_2;
        Error_Data.Case_II.V = Ref_Data.V(:,3) - Car_Data.Case_II.V_2_2(:,1);
        
    case "Case_III"
        Neum_Data.Case_III.V1 = Info_N1(:,1:2);
        Neum_Data.Case_III.Fneum1 = Info_N1(:,3:5);
        Neum_Data.Case_III.Alpha1 = Info_N1(:,6);
        
        Neum_Data.Case_III.V2 = Info_N2(:,1:2);
        Neum_Data.Case_III.Fneum2 = Info_N2(:,3:5);
        Neum_Data.Case_III.Alpha2 = Info_N2(:,6);
        
        Control_Data.Case_III.Fx_2 = Fx_2;
        Control_Data.Case_III.delta = delta;
        Control_Data.Case_III.delta_deg = rad2deg(Control_Data.Case_III.delta);
        
        Car_Data.Case_III.XY_2 = Mov_Vehicle_2(:,1:2);
        Car_Data.Case_III.XY_CM = Mov_Vehicle_CM(:,1:2);
        
        Car_Data.Case_III.V_2 = Mov_Vehicle_2(:,3:4);
        Car_Data.Case_III.V_CM = Mov_Vehicle_CM(:,3:4);
        
        Car_Data.Case_III.W_CM = Mov_Vehicle_CM(:,5);
        
        Car_Data.Case_III.Theta = theta;
        
        Error_Data.Case_III.XY = Ref_Data.XY(:,1:2) - Car_Data.Case_III.XY_2;
        Error_Data.Case_III.V = Ref_Data.V(:,3) - Neum_Data.Case_III.V2(:,1);
        
    case "Case_IV"
        Neum_Data.Case_IV.V1 = Info_N1(:,1:2);
        Neum_Data.Case_IV.Fneum1 = Info_N1(:,3:5);
        Neum_Data.Case_IV.Alpha1 = Info_N1(:,6);
        Neum_Data.Case_IV.Slip1 = Info_N1(:,7);
        
        Neum_Data.Case_IV.V2 = Info_N2(:,1:2);
        Neum_Data.Case_IV.Fneum2 = Info_N2(:,3:5);
        Neum_Data.Case_IV.Alpha2 = Info_N2(:,6);
        Neum_Data.Case_IV.Slip2 = Info_N2(:,7);
        
        Neum_Data.Case_IV.Rg = Neum.Rg;
        
        Neum_Data.Case_IV.Wneum1 = wneums(:,1);
        Neum_Data.Case_IV.Wneum2 = wneums(:,2);
        
        Control_Data.Case_IV.Mu_2 = Mu_2;
        Control_Data.Case_IV.delta = delta;
        Control_Data.Case_IV.delta_deg = rad2deg(Control_Data.Case_IV.delta);
        
        Car_Data.Case_IV.XY_2 = Mov_Vehicle_2(:,1:2);
        Car_Data.Case_IV.XY_CM = Mov_Vehicle_CM(:,1:2);
        
        Car_Data.Case_IV.V_2 = Mov_Vehicle_2(:,3:4);
        Car_Data.Case_IV.V_CM = Mov_Vehicle_CM(:,3:4);
        
        Car_Data.Case_IV.W_CM = Mov_Vehicle_CM(:,5);
        
        Car_Data.Case_IV.Theta = theta;
        
        Error_Data.Case_IV.XY = Ref_Data.XY(:,1:2) - Car_Data.Case_IV.XY_2;
        Error_Data.Case_IV.V = Ref_Data.V(:,3) - Neum_Data.Case_IV.V2(:,1);
        
    case "Case_V"
        Neum_Data.Case_V.V1_I = Info_N1_I(:,1:2);
        Neum_Data.Case_V.Fneum1_I = Info_N1_I(:,3:5);
        Neum_Data.Case_V.Alpha1_I = Info_N1_I(:,6);
        Neum_Data.Case_V.Slip1_I = Info_N1_I(:,7);
        
        Neum_Data.Case_V.V1_D = Info_N1_D(:,1:2);
        Neum_Data.Case_V.Fneum1_D = Info_N1_D(:,3:5);
        Neum_Data.Case_V.Alpha1_D = Info_N1_D(:,6);
        Neum_Data.Case_V.Slip1_D = Info_N1_D(:,7);
        
        Neum_Data.Case_V.V2_D = Info_N2_D(:,1:2);
        Neum_Data.Case_V.Fneum2_D = Info_N2_D(:,3:5);
        Neum_Data.Case_V.Alpha2_D = Info_N2_D(:,6);
        Neum_Data.Case_V.Slip2_D = Info_N2_D(:,7);
        
        Neum_Data.Case_V.V2_I = Info_N2_I(:,1:2);
        Neum_Data.Case_V.Fneum2_I = Info_N2_I(:,3:5);
        Neum_Data.Case_V.Alpha2_I = Info_N2_I(:,6);
        Neum_Data.Case_V.Slip2_I = Info_N2_I(:,7);
        
        Neum_Data.Case_V.Rg = Neum.Rg;
        Neum_Data.Case_V.V2 = v2_2;
        
        Neum_Data.Case_V.Wneum1_D = wneums(:,1);
        Neum_Data.Case_V.Wneum1_I = wneums(:,2);
        Neum_Data.Case_V.Wneum2_D = wneums(:,3);
        Neum_Data.Case_V.Wneum2_I = wneums(:,4);
        
        Control_Data.Case_V.Mu_2 = Mu_2;
        Control_Data.Case_V.delta = delta;
        Control_Data.Case_V.delta_deg = rad2deg(Control_Data.Case_V.delta);
        
        Car_Data.Case_V.XY_2 = Mov_Vehicle_2(:,1:2);
        Car_Data.Case_V.XY_CM = Mov_Vehicle_CM(:,1:2);
        
        Car_Data.Case_V.V_2 = Mov_Vehicle_2(:,3:4);
        Car_Data.Case_V.V_CM = Mov_Vehicle_CM(:,3:4);
        
        Car_Data.Case_V.W_CM = Mov_Vehicle_CM(:,5);
        
        Car_Data.Case_V.Theta = theta;
        
        Error_Data.Case_V.XY = Ref_Data.XY(:,1:2) - Car_Data.Case_V.XY_2;
        Error_Data.Case_V.V = Ref_Data.V(:,3) - v2_2;
        
    case "Case_VI"
        Neum_Data.Case_VI.V1 = Info_N1(:,1:2);
        Neum_Data.Case_VI.Fneum1 = Info_N1(:,3:5);
        Neum_Data.Case_VI.Alpha1 = Info_N1(:,6);
        Neum_Data.Case_VI.Slip1 = Info_N1(:,7);
        
        Neum_Data.Case_VI.V2 = Info_N2(:,1:2);
        Neum_Data.Case_VI.Fneum2 = Info_N2(:,3:5);
        Neum_Data.Case_VI.Alpha2 = Info_N2(:,6);
        Neum_Data.Case_VI.Slip2 = Info_N2(:,7);
        
        Neum_Data.Case_VI.Rg = Neum.Rg;
        
        Neum_Data.Case_VI.Wneum1 = wneums(:,1);
        Neum_Data.Case_VI.Wneum2 = wneums(:,2);
        
        Control_Data.Case_VI.Mu_2 = Mu_2;
        Control_Data.Case_VI.delta = delta;
        Control_Data.Case_VI.delta_deg = rad2deg(Control_Data.Case_VI.delta);
        
        Car_Data.Case_VI.XY_2 = Mov_Vehicle_2(:,1:2);
        Car_Data.Case_VI.XY_CM = Mov_Vehicle_CM(:,1:2);
        
        Car_Data.Case_VI.V_2 = Mov_Vehicle_2(:,3:4);
        Car_Data.Case_VI.V_CM = Mov_Vehicle_CM(:,3:4);
        
        Car_Data.Case_VI.W_CM = Mov_Vehicle_CM(:,5);
        Car_Data.Case_VI.PSI_CM = Mov_Vehicle_CM(:,6);
        Car_Data.Case_VI.Z_CM = Mov_Vehicle_CM(:,7);
        Car_Data.Case_VI.omega_psi = Mov_Vehicle_CM(:,8);
        
        Car_Data.Case_VI.Theta = theta;
        
        Error_Data.Case_VI.XY = Ref_Data.XY(:,1:2) - Car_Data.Case_VI.XY_2;
        Error_Data.Case_VI.V = Ref_Data.V(:,3) - Neum_Data.Case_VI.V2(:,1);
end

% Limpio las variables de Simulink
% clearvars -except Ref_Data Global_Data Model_Data Map_Data Neum_Data Car_Data Control_Data Error_Data
