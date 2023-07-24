% ***************** Read file from netlist_id_vg_sat_100e-6_100e-6_TT_lib.print ***************** %
filename_meas_TT = 'netlist_id_vg_sat_100e-6_100e-6_TT_lib.print';
fid_TT = fopen(filename_meas_TT,'r');

text1_TT = textscan(fid_TT,'%s');

text2_TT = text1_TT{1};

Ids_TT = text2_TT(1:2:end);
Vgs_TT = text2_TT(2:2:end); 

newText2_TT = [Vds_TT Ids_TT];

Vgs_1TT = Vds_TT(13:193);
Vgs_2TT = Vds_TT(14:193);

Ids_1TT = Ids_TT(14:194);
Ids_2TT = Ids_TT(208:388);
Ids_3TT = Ids_TT(402:582);
Ids_4TT = Ids_TT(596:776);
Ids_5TT = Ids_TT(790:970);
Ids_6TT = Ids_TT(984:1164);
Ids_7TT = Ids_TT(1178:1358);
 
Ids_all_TT=[Ids_1TT Ids_2TT Ids_3TT Ids_4TT Ids_5TT Ids_6TT Ids_7TT];
Vgs_Ids_TT=[Vgs_1TT Ids_all_TT];

x_TT = str2double(Vgs_1TT);
x1_TT = str2double(Vgs_2TT);

y1_TT = str2double(Ids_1TT);
y2_TT = str2double(Ids_2TT);
y3_TT = str2double(Ids_3TT);
y4_TT = str2double(Ids_4TT);
y5_TT = str2double(Ids_5TT);
y6_TT = str2double(Ids_6TT);
y7_TT = str2double(Ids_7TT);
y_TT = str2double(Ids_all_TT);
y_Ids_array_TT= [x_TT y_TT];

% ***************** END of netlist_id_vg_sat_100e-6_100e-6_TT_lib.print ***************** %



% ***************** Read file from netlist_id_vg_sat_100e-6_100e-6_SS_lib.print ***************** %
filename_meas_SS = 'netlist_id_vg_sat_100e-6_100e-6_SS_lib.print';
fid_SS = fopen(filename_meas_SS,'r');

text3_SS = textscan(fid_SS,'%s');

text4_SS = text3_SS{1};

Ids_SS = text4_SS(1:2:end);
Vgs_SS = text4_SS(2:2:end); 

newText4_SS= [Vgs_SS Ids_SS];

Vgs_1SS = Vgs_SS(13:193);
Vgs_2SS = Vgs_SS(14:193);

Ids_1SS = Ids_SS(14:194);
Ids_2SS = Ids_SS(208:388);
Ids_3SS = Ids_SS(402:582);
Ids_4SS = Ids_SS(596:776);
Ids_5SS = Ids_SS(790:970);
Ids_6SS = Ids_SS(984:1164);
Ids_7SS = Ids_SS(1178:1358);
 
Ids_all_SS=[Ids_1SS Ids_2SS Ids_3SS Ids_4SS Ids_5SS Ids_6SS Ids_7SS];
Vgs_Ids_SS=[Vgs_1SS Ids_1SS Ids_2SS Ids_3SS Ids_4SS Ids_5SS Ids_6SS Ids_7SS];

x_SS = str2double(Vgs_1SS);
x1_SS = str2double(Vgs_2SS);

y1_SS = str2double(Ids_1SS);
y2_SS = str2double(Ids_2SS);
y3_SS = str2double(Ids_3SS);
y4_SS = str2double(Ids_4SS);
y5_SS = str2double(Ids_5SS);
y6_SS = str2double(Ids_6SS);
y7_SS = str2double(Ids_7SS);
y_SS = str2double(Ids_all_SS);
y_Ids_array_SS= [x_SS y_SS];

% ***************** END of netlist_id_vg_sat_100e-6_100e-6_SS_lib.print ***************** %



% ***************** Read file from netlist_id_vg_sat_100e-6_100e-6_FF_lib.print ***************** %
filename_meas_FF = 'netlist_id_vg_sat_100e-6_100e-6_FF_lib.print';
fid_FF = fopen(filename_meas_FF,'r');

text5_FF = textscan(fid_FF,'%s');

text6_FF = text5_FF{1};

Ids_FF = text6_FF(1:2:end);
Vgs_FF = text6_FF(2:2:end); 

newText6_FF = [Vgs_FF Ids_FF];

Vgs_1FF = Vgs_FF(13:193);
Vgs_2FF = Vgs_FF(14:193);

Ids_1FF = Ids_FF(14:194);
Ids_2FF = Ids_FF(208:388);
Ids_3FF = Ids_FF(402:582);
Ids_4FF = Ids_FF(596:776);
Ids_5FF = Ids_FF(790:970);
Ids_6FF = Ids_FF(984:1164);
Ids_7FF = Ids_FF(1178:1358);
 
Ids_all_FF = [Ids_1FF Ids_2FF Ids_3FF Ids_4FF Ids_5FF Ids_6FF Ids_7FF];
Vgs_Ids_FF = [Vgs_1FF Ids_1FF Ids_2FF Ids_3FF Ids_4FF Ids_5FF Ids_6FF Ids_7FF];

x_FF = str2double(Vgs_1FF);
x1_FF = str2double(Vgs_2FF);

y1_FF = str2double(Ids_1FF);
y2_FF = str2double(Ids_2FF);
y3_FF = str2double(Ids_3FF);
y4_FF = str2double(Ids_4FF);
y5_FF = str2double(Ids_5FF);
y6_FF = str2double(Ids_6FF);
y7_FF = str2double(Ids_7FF);
y_FF = str2double(Ids_all_FF);
y_Ids_array_FF = [x_FF y_FF];
% ***************** END of netlist_id_vg_sat_100e-6_100e-6_FF_lib.print ***************** %



% ***************** Calculate Derivative of d(Ids)/d(Vgds) ***************** %
% ****** TT ****** %
dy1_TT = diff(y1_TT)./diff(x_TT);
dy2_TT = diff(y2_TT)./diff(x_TT);
dy3_TT = diff(y3_TT)./diff(x_TT);
dy4_TT = diff(y4_TT)./diff(x_TT);
dy5_TT = diff(y5_TT)./diff(x_TT);
dy6_TT = diff(y6_TT)./diff(x_TT);
dy7_TT = diff(y7_TT)./diff(x_TT);

dy_array_TT = [dy1_TT dy2_TT dy3_TT dy4_TT dy5_TT dy6_TT dy7_TT]; 
Vgs_dy_TT= [x1_TT dy_array_TT];

% ****** SS ****** %
dy1_SS = diff(y1_SS)./diff(x_SS);
dy2_SS = diff(y2_SS)./diff(x_SS);
dy3_SS = diff(y3_SS)./diff(x_SS);
dy4_SS = diff(y4_SS)./diff(x_SS);
dy5_SS = diff(y5_SS)./diff(x_SS);
dy6_SS = diff(y6_SS)./diff(x_SS);
dy7_SS = diff(y7_SS)./diff(x_SS);

dy_array_SS = [dy1_SS dy2_SS dy3_SS dy4_SS dy5_SS dy6_SS dy7_SS]; 
Vgs_dy_SS= [x1_SS dy_array_SS];

% ****** FF ****** %
dy1_FF = diff(y1_FF)./diff(x_FF);
dy2_FF = diff(y2_FF)./diff(x_FF);
dy3_FF = diff(y3_FF)./diff(x_FF);
dy4_FF = diff(y4_FF)./diff(x_FF);
dy5_FF = diff(y5_FF)./diff(x_FF);
dy6_FF = diff(y6_FF)./diff(x_FF);
dy7_FF = diff(y7_FF)./diff(x_FF);

dy_array_FF = [dy1_FF dy2_FF dy3_FF dy4_FF dy5_FF dy6_FF dy7_FF]; 
Vgs_dy_FF= [x1_FF dy_array_FF];
% ***************** END of Calculation  ***************** %



% ***************** Plot Graph ***************** %
% ****** Normal ****** %
figure(1)
subplot(2,2,1);
plot(x_TT,y_TT,x_SS,y_SS,'--',x_FF,y_FF,':');
xlabel('Vgs');
ylabel('Ids');
title('1. Vgs vs Ids');
% saveas(gcf,'id_vg_graph(TTSSFF).png')
saveas(gcf,'id_vg_4combined_graph(TTSSFF).png')
legend('TT.Ids1','TT.Ids2','TT.Ids3','TT.Ids4','TT.Ids5','TT.Ids6','TT.Ids7','SS.Ids1','SS.Ids2','SS.Ids3','SS.Ids4','SS.Ids5','SS.Ids6','SS.Ids7','FF.Ids1','FF.Ids2','FF.Ids3','FF.Ids4','FF.Ids5','FF.Ids6','FF.Ids7','Location','NorthEastOutside')

% ****** Log axis y ****** %
% figure(2)
subplot(2,2,2);
semilogy(x_TT,y_TT,x_SS,y_SS,'--',x_FF,y_FF,':');
xlabel('Vgs');
ylabel('Ids');
title('2. Log Vgs vs Ids');
% saveas(gcf,'id_vg_log_graph(TTSSFF).png')
legend('TT.Ids1','TT.Ids2','TT.Ids3','TT.Ids4','TT.Ids5','TT.Ids6','TT.Ids7','SS.Ids1','SS.Ids2','SS.Ids3','SS.Ids4','SS.Ids5','SS.Ids6','SS.Ids7','FF.Ids1','FF.Ids2','FF.Ids3','FF.Ids4','FF.Ids5','FF.Ids6','FF.Ids7','Location','NorthEastOutside')

% ****** Derivative ****** %
% figure(3)
subplot(2,2,3);
plot(x1_TT,dy_array_TT, x1_SS,dy_array_SS, x1_FF,dy_array_FF);
% semilogy((x1_TT,dy_array_TT, x1_SS,dy_array_SS, x1_FF,dy_array_FF);
xlabel('Vgs');
ylabel('d(Ids)/d(Vgs)');
title('3. Derivative: Vgs vs d(Ids)/d(Vgs)');
% saveas(gcf,'id_vg_derivate_graph(TTSSFF).png')
legend('TT.d(Ids1)/d(Vgs)','TT.d(Ids2)/d(Vgs)','TT.d(Ids3)/d(Vgs)','TT.d(Ids4)/d(Vgs)','TT.d(Ids5)/d(Vgs)','TT.d(Ids6)/d(Vgs)','TT.d(Ids7)/d(Vgs)','SS.d(Ids1)/d(Vgs)','SS.d(Ids2)/d(Vgs)','SS.d(Ids3)/d(Vgs)','SS.d(Ids4)/d(Vgs)','SS.d(Ids5)/d(Vgs)','SS.d(Ids6)/d(Vgs)','SS.d(Ids7)/d(Vgs)','FF.d(Ids1)/d(Vgs)','FF.d(Ids2)/d(Vgs)','FF.d(Ids3)/d(Vgs)','FF.d(Ids4)/d(Vgs)','FF.d(Ids5)/d(Vgs)','FF.d(Ids6)/d(Vgs)','FF.d(Ids7)/d(Vgs)','Location','NorthEastOutside')

% ****** Log Derivative ****** %
% figure(4)
subplot(2,2,4);
semilogy(x1_TT,dy_array_TT, x1_SS,dy_array_SS,'--', x1_FF,dy_array_FF,':');
xlabel('Vgs');
ylabel('d(Ids)/d(Vgs)');
title('4. Log Derivative: Vgs vs d(Ids)/d(Vgs)');
% saveas(gcf,'id_vg_derivate_log_graph(TTSSFF).png')
legend('TT.d(Ids1)/d(Vgs)','TT.d(Ids2)/d(Vgs)','TT.d(Ids3)/d(Vgs)','TT.d(Ids4)/d(Vgs)','TT.d(Ids5)/d(Vgs)','TT.d(Ids6)/d(Vgs)','TT.d(Ids7)/d(Vgs)','SS.d(Ids1)/d(Vgs)','SS.d(Ids2)/d(Vgs)','SS.d(Ids3)/d(Vgs)','SS.d(Ids4)/d(Vgs)','SS.d(Ids5)/d(Vgs)','SS.d(Ids6)/d(Vgs)','SS.d(Ids7)/d(Vgs)','FF.d(Ids1)/d(Vgs)','FF.d(Ids2)/d(Vgs)','FF.d(Ids3)/d(Vgs)','FF.d(Ids4)/d(Vgs)','FF.d(Ids5)/d(Vgs)','FF.d(Ids6)/d(Vgs)','FF.d(Ids7)/d(Vgs)','Location','NorthEastOutside')

