% ***************** Read file from netlist_id_vg_sat_100e-6_100e-6_TT_lib.print ***************** %
filename_meas = 'netlist_id_vg_sat_100e-6_100e-6_TT_lib.print';
fid_1 = fopen(filename_meas,'r');

text = textscan(fid_1,'%s');
text2=text{1};

Igs = text2(1:2:end);
Vgs = text2(2:2:end); 

newText2 = [Vgs Igs ];

Vgs_1 = Vgs(13:193);

Igs_1 = Igs(14:194);
Igs_2 = Igs(208:388);
Igs_3 = Igs(402:582);
Igs_4 = Igs(596:776);
Igs_5 = Igs(790:970);
Igs_6 = Igs(984:1164);
Igs_7 = Igs(1178:1358);


Igs_all=[Igs_1 Igs_2 Igs_3 Igs_4 Igs_5 Igs_6 Igs_7];
Vgs_Igs=[Vgs_1 Igs_1 Igs_2 Igs_3 Igs_4 Igs_5 Igs_6 Igs_7];


x = str2double(Vgs_1);
% y1 = str2double(Igs_1);
% y2 = str2double(Igs_2);
% y3 = str2double(Igs_3);
% y4 = str2double(Igs_4);
% y5 = str2double(Igs_5);
% y6 = str2double(Igs_6);
% y7 = str2double(Igs_7);

% p = plot(x,y1,x,y2,x,y3,x,y4,x,y5,x,y6,x,y7);
y=str2double(Igs_all);

figure(1)
subplot(2,2,1);
plot(x,y);
xlabel('Vgs');
ylabel('Igs');
title('1. id vg Vgs vs Igs');
% saveas(gcf,'id_vg_graph.png')
saveas(gcf,'4graph combined.png')
legend('TT.Igs1','TT.Igs2','TT.Igs3','TT.Igs4','TT.Igs5','TT.Igs6','TT.Igs7','Location','NorthEastOutside')


% figure(2)
subplot(2,2,2);
% loglog(x,y);
% plot(x, log(y))
semilogy(x, y);
xlabel('Log Vgs');
ylabel('Log Igs');
title('2. Log id vg  Vgs vs Igs');
% saveas(gcf,'id_vg_log_graph.png')
legend('TT.Igs1','TT.Igs2','TT.Igs3','TT.Igs4','TT.Igs5','TT.Igs6','TT.Igs7','Location','NorthEastOutside');

% ***************** END of id_vg_sat_100e-6_100e-6_TT_lib ***************** %

% ***************** read file from netlist_ib_vg_TT_lib.print ***************** %
filename_meas_1 = 'netlist_ib_vg_TT_lib.print';
fid_2 = fopen(filename_meas_1,'r');

text3 = textscan(fid_2,'%s');

text4 = text3{1};

Igs1 = text4(1:2:end);
Vgs1 = text4(2:2:end); 

newText4 = [Igs1 Vgs1];
% newIgs = setdiff(Igs, {'DC', '***', '(', ')','*', '25.0','27.0','=','Netlist','par(','sweep','x'});
% newVgs = setdiff(Igs, {'(', ')','*','******','Analysis', 'dcrun1-000_dcrun1','tnom=','temp=','******','VDD','3.00000','***','GG','(-(1)*i(vb))','25.0','27.0','=','Netlist','par(','sweep','x','DC'});

Vgs_11 = Vgs1(13:193);

Igs_11 = Igs1(14:194);
Igs_21 = Igs1(208:388);
Igs_31 = Igs1(402:582);
% Igs_4 = Igs(596:776);
% Igs_5 = Igs(790:970);
% Igs_6 = Igs(984:1164);
% Igs_7 = Igs(1178:1358);
 
Igs_all1=[Igs_11 Igs_21 Igs_31];
Vgs_Igs1=[Vgs_11 Igs_11 Igs_21 Igs_31];

x1 = str2double(Vgs_11);
y1 = str2double(Igs_all1);

% ***************** plot graph ***************** %
% figure(3)
subplot(2,2,3);
plot(x1,y1,'r');
xlabel('Vgs');
ylabel('Igs');
title('3. ib vg Vgs vs Igs');
% saveas(gcf,'ib_vg_graph.png')
legend('TT.Igs1','TT.Igs2','TT.Igs3','TT.Igs4','TT.Igs5','TT.Igs6','TT.Igs7','Location','NorthEastOutside');


% figure(4)
subplot(2,2,4);
% loglog(x1,y1,'b');
semilogx(x1,y1,'b');
xlabel('Log Vgs');
ylabel('Log Igs');
title('4. ib vg Log Vgs vs Igs');
% saveas(gcf,'ib_vg_log_graph.png')
legend('TT.Igs1','TT.Igs2','TT.Igs3','TT.Igs4','TT.Igs5','TT.Igs6','TT.Igs7','Location','NorthEastOutside');
