% ***************** Read file from netlist_id_vd_vb0_TT_lib.print ***************** %
filename_meas_TT = 'netlist_id_vd_vb0_TT_lib.print';
fid_TT = fopen(filename_meas_TT,'r');

text1_TT = textscan(fid_TT,'%s');

text2_TT = text1_TT{1};

Ids_TT = text2_TT(1:2:end);
Vds_TT = text2_TT(2:2:end);

newText2_TT = [Vds_TT Ids_TT];

Vds_1TT = Vds_TT(13:193);
Vds_2TT = Vds_TT(14:193);

Ids_1TT = Ids_TT(14:194);
Ids_2TT = Ids_TT(208:388);
Ids_3TT = Ids_TT(402:582);


Ids_all_TT=[Ids_1TT Ids_2TT Ids_3TT];
Vds_Ids_TT=[Vds_1TT Ids_all_TT];

x_TT = str2double(Vds_1TT);
x1_TT = str2double(Vds_2TT);

y1_TT = str2double(Ids_1TT);
y2_TT = str2double(Ids_2TT);
y3_TT = str2double(Ids_3TT);

y_TT = str2double(Ids_all_TT);
y_Ids_array_TT= [x_TT y_TT];

% ***************** END of netlist_id_vd_vb0_TT_lib.print ***************** %



% ***************** Read file from netlist_id_vd_vb0_SS_lib.print ***************** %
filename_meas_SS = 'netlist_id_vd_vb0_SS_lib.print';
fid_SS = fopen(filename_meas_SS,'r');

text3_SS = textscan(fid_SS,'%s');

text4_SS = text3_SS{1};

Ids_SS = text4_SS(1:2:end);
Vds_SS = text4_SS(2:2:end);

newText4_SS= [Vds_SS Ids_SS];

Vds_1SS = Vds_SS(13:193);
Vds_2SS = Vds_SS(14:193);

Ids_1SS = Ids_SS(14:194);
Ids_2SS = Ids_SS(208:388);
Ids_3SS = Ids_SS(402:582);


Ids_all_SS=[Ids_1SS Ids_2SS Ids_3SS ];
Vds_Ids_SS=[Vds_1SS Ids_all_SS];

x_SS = str2double(Vds_1SS);
x1_SS = str2double(Vds_2SS);

y1_SS = str2double(Ids_1SS);
y2_SS = str2double(Ids_2SS);
y3_SS = str2double(Ids_3SS);

y_SS = str2double(Ids_all_SS);
y_Ids_array_SS= [x_SS y_SS];

% ***************** END of netlist_id_vd_vb0_SS_lib.print ***************** %



% ***************** Read file from netlist_id_vd_vb0_FF_lib.print ***************** %
filename_meas_FF = 'netlist_id_vd_vb0_FF_lib.print';
fid_FF = fopen(filename_meas_FF,'r');

text5_FF = textscan(fid_FF,'%s');

text6_FF = text5_FF{1};

Ids_FF = text6_FF(1:2:end);
Vds_FF = text6_FF(2:2:end);

newText6_FF = [Vds_FF Ids_FF];

Vds_1FF = Vds_FF(13:193);
Vds_2FF = Vds_FF(14:193);

Ids_1FF = Ids_FF(14:194);
Ids_2FF = Ids_FF(208:388);
Ids_3FF = Ids_FF(402:582);

Ids_all_FF=[Ids_1FF Ids_2FF Ids_3FF ];
Vds_Ids_FF = [Vds_1FF Ids_1FF];

x_FF = str2double(Vds_1FF);
x1_FF = str2double(Vds_2FF);

y1_FF = str2double(Ids_1FF);
y2_FF = str2double(Ids_2FF);
y3_FF = str2double(Ids_3FF);

y_FF = str2double(Ids_all_FF);
y_Ids_array_FF = [x_FF y_FF];
% ***************** END of netlist_id_vd_vb0_FF_lib.print ****************** %



% ***************** Calculate Derivative of d(Ids)/d(Vgds) ***************** %
% ****** TT ****** %
dy1_TT =diff(y1_TT)./diff(x_TT);
dy2_TT = diff(y2_TT)./diff(x_TT);
dy3_TT = diff(y3_TT)./diff(x_TT);


dy_array_TT = [dy1_TT dy2_TT dy3_TT];
Vds_dy_TT= [x1_TT dy_array_TT];

% ****** SS ****** %
dy1_SS = diff(y1_SS)./diff(x_SS);
dy2_SS = diff(y2_SS)./diff(x_SS);
dy3_SS = diff(y3_SS)./diff(x_SS);

dy_array_SS = [dy1_SS dy2_SS dy3_SS];
Vds_dy_SS= [x1_SS dy_array_SS];

% ****** FF ****** %
dy1_FF = diff(y1_FF)./diff(x_FF);
dy2_FF = diff(y2_FF)./diff(x_FF);
dy3_FF = diff(y3_FF)./diff(x_FF);

dy_array_FF = [dy1_FF dy2_FF dy3_FF];
Vds_dy_FF = [x1_FF dy_array_FF];
% ***************** END of Calculation  ***************** %



% ***************** Calculate Reciprocal of derivative 1/[d(Ids)/d(Vgds)] ***************** %
% ****** TT ****** %
reciprocal_TT1 = 1./dy1_TT;
reciprocal_TT2 = 1./dy2_TT;
reciprocal_TT3 = 1./dy3_TT;

reciprocal_array_TT = [reciprocal_TT1 reciprocal_TT2 reciprocal_TT3];

dy_reciprocal_TT = [x1_TT reciprocal_array_TT];

% ****** SS ****** %

reciprocal_SS1 = 1./dy1_SS;
reciprocal_SS2 = 1./dy2_SS;
reciprocal_SS3 = 1./dy3_SS;

reciprocal_array_SS = [reciprocal_SS1 reciprocal_SS2 reciprocal_SS3];

dy_reciprocal_SS = [x1_SS reciprocal_array_SS];

% ****** FF ****** %
reciprocal_FF1 = 1./dy1_FF;
reciprocal_FF2 = 1./dy2_FF;
reciprocal_FF3 = 1./dy3_FF;

reciprocal_array_FF = [reciprocal_FF1 reciprocal_FF2 reciprocal_FF3];

dy_reciprocal_FF = [x1_FF reciprocal_array_FF];
% ***************** END of Calculation  ***************** %



% ***************** plot graph ***************** %
figure(5)
subplot(1,2,1);
plot(x_TT, y_TT, x_SS, y_SS, '--', x_FF,y_FF,':')
title('1. Vds vs Ids');
xlabel('Vds');
ylabel('Ids');
% saveas(gcf,'id_vd_graph(TTSSFF).png')
saveas(gcf,'id_vd_combined_graph(TTSSFF).png')
legend('TT.Ids1','TT.Ids2','TT.Ids3','SS.Ids1','SS.Ids2','SS.Ids3', 'FF.Ids1', 'FF.Ids2', 'FF.Ids3','Location','NorthEastOutside')


% figure(7)
subplot(1,2,2);
semilogy(x1_TT, reciprocal_array_TT, x1_SS, reciprocal_array_SS, '--', x1_FF, reciprocal_array_FF,':')
% title('3. Reciprocal of Derivative (Log axis)');
title('2. Reciprocal of Derivative (Log axis)');
xlabel('Vds');
ylabel('Log(1/[d(Ids)/d(Vgds)])');
% saveas(gcf,'id_vd_derivate_reciprocal_graph(TTSSFF).png')
legend('TT.1/[d(Ids1)/d(Vgds)]','TT.1/[d(Ids2)/d(Vgds)]','TT.1/[d(Ids3)/d(Vgds)]','SS.1/[d(Ids1)/d(Vgds)]','SS.1/[d(Ids2)/d(Vgds)]','SS.1/[d(Ids3)/d(Vgds)]', 'FF.1/[d(Ids1)/d(Vgds)]', 'FF.1/[d(Ids2)/d(Vgds)]', 'FF.1/[d(Ids3)/d(Vgds)]','Location','NorthEastOutside')

% figure(6)
% subplot(1,1,1);
% plot(x1_TT, dy_array_TT, x1_SS, dy_array_SS, '--', x1_FF, dy_array_FF,':')
% title('2.Derivative');
% xlabel('Vds');
% ylabel('d(Ids)/d(Vgds)');
% saveas(gcf,'id_vd_derivate_graph(TTSSFF).png')
% legend('TT.d(Ids1)/d(Vgds)','TT.d(Ids2)/d(Vgds)','TT.d(Ids3)/d(Vgds)','SS.d(Ids1)/d(Vgds)','SS.d(Ids2)/d(Vgds)','SS.d(Ids3)/d(Vgds)', 'FF.d(Ids1)/d(Vgds)', 'FF.d(Ids2)/d(Vgds)', 'FF.d(Ids3)/d(Vgds)','Location','NorthEastOutside')
% 

% ***************** END of plotting ***************** %

