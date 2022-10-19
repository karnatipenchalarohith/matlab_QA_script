% Please fill items in line 
close all;
clear all;
path=pwd;
delete netlist_vth_l_TT_lib.sp;
delete netlist_vth_l_SS_lib.sp;
delete netlist_vth_l_FF_lib.sp;
delete netlist_vth_w_TT_lib.sp;
delete netlist_vth_w_SS_lib.sp;
delete netlist_vth_w_FF_lib.sp;
delete netlist_vth_l_TT_lib.measure;
delete netlist_vth_l_SS_lib.measure;
delete netlist_vth_l_FF_lib.measure;
delete netlist_vth_w_TT_lib.measure;
delete netlist_vth_w_SS_lib.measure;
delete netlist_vth_w_FF_lib.measure;

% % pls fill library path and corners
% lib = '/user/rkar/model_assessments/edamc_model_assessment/trunk/a30/model/all.scs';
% corner = {'TT_lib','SS_lib','FF_lib'};
% % Pls enter the gds targets NMOS(positive targets) PMOS (Negative Targets)
% gds_silicon = [-0.46 -0.16 -0.76];
% % Pls fill monte-carlo runs and no. of runs
% monte_corner = 'mc_lib';
% monteruns = '300';
% % Pls enter the model name
% modelname='modpil';
% 
% % Pls enter the model dimensions
% W='10e-6';
% L='1.2e-6';
% m='1';
% nf='1';
% % Pls enter the temperature
% temperature='27';
% % Pls enter the Bias. (e.g.) VGmax = 3.3 for NMOS VGS= -3.3 for PMOS
% VGmax='-3.3';
% VG_Step='-0.01';
% VDmax='-3.3';
% VDD='-3.3';
% vds_gds = '-1';
% % Pls enter the no. of terminals
% Terminals=5;
% % Pls enter the iref for Vth calculations NMOS iref=2e-6 PMOS iref=1e-6 
% iref='1e-6';
% 
% % Pls enter the flag. Flag_fet = 1 for NMOS and Flag_fet=-1 for PMOS.
% flag_fet = -1;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% start of fill %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% NMOSI device
% pls fill library path and corners
lib = '/user/rkar/data_from_tp/model_assessments/edamc_model_assessment/trunk/tA11/model/all.scs';
corner = {'TT_lib','SS_lib','FF_lib'};

% Pls enter the gds targets
%gds_silicon = [1.2 0.75 1.65];

% Pls fill monte-carlo runs and no. of runs
% monte_corner = 'mc_lib';
% monteruns = '300';

% Pls enter the model name
modelname='nch_hvt_mis';

% Pls enter the model dimensions; Just nominal device
W='10e-6';
L='1.2e-6';
m='1';
nf='1';

wmin = 0.22e-6;
wmax = 100e-6;
lmin = 0.18e-6;
lmax = 100e-6;

% Pls enter the temperature
temperature='27';

% Pls enter the Bias. (e.g.) VGmax = 3.3 for NMOS VGS= -3.3 for PMOS
VGmax='1.2';
VG_Step='0.01';
VDmax='1.2';
VDD='1.2';
%vds_gds = '0.8';
Vdlin='0.1';
vdd_sat='1.32'

% Pls enter the no. of terminals
Terminals='5';

% Pls enter the iref for Vth calculations
iref='1e-7';

% Pls enter the flag. Flag_fet = 1 for NMOS and Flag_fet=-1 for PMOS.
flag_fet = 1;
shrink = 0.9;

% %ib_vg
% VDD_sub_Start = '3';
% VDD_sub_End = '3.6';
% VDD_sub_Step = '0.3';
% 
% %ig_vg
% VDD_ig_Start = '-0';
% VDD_ig_Stop = '-3';
% VDD_ig_Step = '-0.5';
% 
% %id_vg
% VBB_Start = '0';
% VBB_Stop = '3';
% VBB_Step = '0.5';

%id_vd
%GG_Start = '0.9';
%GG_Stop = VGmax;
%GG_Step = '0.6';
%VD_VB = '0';

%this is multiplier for the W & L; lmin*lminmultipler & wmin*wminmultipler is done in the code; you can choose any numbers, so that the whole this falls 
% between lmin & lmax and wmin & wmax
% pls fill this %%%%
lminmultipler = [100 80 60 40 30 20 15 12 10 9 8 6 5 4.5 4 3.8 3.5 3.1 3 2.7 2.5 2.2 2.1 2 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1 1];
wminmultipler = [100 80 60 40 30 20 15 12 10 9 8 6 5 4.5 4 3.8 3.5 3.1 3 2.7 2.5 2.2 2.1 2 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1 1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of fill %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vth_a30 =[];


idlin_sim_TT =[];
idlin_sim_SS =[];
idlin_sim_FF =[];
idsat_sim_TT =[];
idsat_sim_SS =[];
idsat_sim_FF =[];
vtlin_sim_TT =[];
vtlin_sim_SS =[];
vtlin_sim_FF =[];
vtsat_sim_TT =[];
vtsat_sim_SS =[];
vtsat_sim_FF =[];
output_idlin =[];
output_idsat =[];
output_vtlin =[];
output_vtsat =[];
ln_sim_fin = [];


idlin_sim_TT_w =[];
idlin_sim_SS_w =[];
idlin_sim_FF_w =[];
idsat_sim_TT_w =[];
idsat_sim_SS_w =[];
idsat_sim_FF_w =[];
vtlin_sim_TT_w =[];
vtlin_sim_SS_w =[];
vtlin_sim_FF_w =[];
vtsat_sim_TT_w =[];
vtsat_sim_SS_w =[];
vtsat_sim_FF_w =[];
output_idlin_w =[];
output_idsat_w =[];
output_vtlin_w =[];
output_vtsat_w =[];
ln_sim_fin_w = [];


for i=1:length(corner)
% %new Function id_vg
% file_netlist1=Generate_id_vg(lib,char(corner(i)),modelname,W,L,m,nf,temperature,VGmax,VDD,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);
% 
% %new Function id_vd
% file_netlist2=Generate_id_vd(lib,char(corner(i)),modelname,W,L,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB,flag_fet,Terminals);
% 
% %new Function ib_vg
% file_netlist3=Generate_ib_vg(lib,char(corner(i)),modelname,W,L,m,nf,temperature,VGmax,VDD,VG_Step,VDD_sub_Start,VDD_sub_End,VDD_sub_Step,flag_fet,Terminals);
% 
% %new Function ig_vg
% file_netlist4=Generate_ig_vg(lib,char(corner(i)),modelname,W,L,m,nf,temperature,VGmax,VDD,VG_Step,VDD_ig_Start,VDD_ig_Stop,VDD_ig_Step,flag_fet,Terminals);

%new Function vth vs l
file_netlist5=Generate_vth_l(lib,char(corner(i)),modelname,W,L,m,temperature,VGmax,VDD,VG_Step,Vdlin,vdd_sat,wmin,wmax,lmin,lmax,flag_fet,Terminals,shrink,lminmultipler);

file_netlist6=Generate_vth_w(lib,char(corner(i)),modelname,W,L,m,temperature,VGmax,VDD,VG_Step,Vdlin,vdd_sat,wmin,wmax,lmin,lmax,flag_fet,Terminals,shrink,wminmultipler);


%function filename = Generate_vth_l(lib,corner,modelname,W,L,m,temperature,VGmax,VDD,VG_Step,VDlin,vdd_sat,wmin,wmax,lmin,lmax,flag_fet,Terminals)


eval(['!spectre ' path '/' file_netlist5]);
eval(['!spectre ' path '/' file_netlist6]);



output_name=regexprep(file_netlist5,'.sp','','ignorecase')

filename=[output_name '.measure'];

output_name_w=regexprep(file_netlist6,'.sp','','ignorecase')

filename_w=[output_name_w '.measure'];

% output_idlin = [output_name '_idlin_sim_' corner(i)];
% output_idsat = [output_name '_idsat_sim_' corner(i)];
% output_vtlin = [output_name '_vtlin_sim_' corner(i)];
% output_vtsat = [output_name '_vtsat_sim_' corner(i)];
% 
% output_idlin = {idlin_sim_TT,idlin_sim_SS,idlin_sim_FF};
% output_idsat = {idsat_sim_TT,idsat_sim_SS,idsat_sim_FF};
% output_vtlin = {vtlin_sim_TT,vtlin_sim_SS,vtlin_sim_FF};
% output_vtsat = {vtsat_sim_TT,vtsat_sim_SS,vtsat_sim_FF};




[output_idlin,output_idsat,output_vtlin,output_vtsat,ln_sim_fin,wn_sim_fin_l] = read_sim_idsat(filename,corner(i),lminmultipler);


[output_idlin_w,output_idsat_w,output_vtlin_w,output_vtsat_w,ln_sim_fin_w,wn_sim_fin] = read_sim_idsat(filename_w,corner(i),wminmultipler);


if i==1
    idlin_sim_TT=output_idlin;
    idsat_sim_TT=output_idsat;
    vtlin_sim_TT=output_vtlin;
    vtsat_sim_TT=output_vtsat;
    
    idlin_sim_TT_w=output_idlin_w;
    idsat_sim_TT_w=output_idsat_w;
    vtlin_sim_TT_w=output_vtlin_w;
    vtsat_sim_TT_w=output_vtsat_w;
    
elseif i==2
    idlin_sim_SS=output_idlin;
    idsat_sim_SS=output_idsat;
    vtlin_sim_SS=output_vtlin;
    vtsat_sim_SS=output_vtsat;    
    
    idlin_sim_SS_w=output_idlin_w;
    idsat_sim_SS_w=output_idsat_w;
    vtlin_sim_SS_w=output_vtlin_w;
    vtsat_sim_SS_w=output_vtsat_w;   
    
elseif i==3
    idlin_sim_FF=output_idlin;
    idsat_sim_FF=output_idsat;
    vtlin_sim_FF=output_vtlin;
    vtsat_sim_FF=output_vtsat;  
    
    
    idlin_sim_FF_w=output_idlin_w;
    idsat_sim_FF_w=output_idsat_w;
    vtlin_sim_FF_w=output_vtlin_w;
    vtsat_sim_FF_w=output_vtsat_w;  
end

end


siz=size(lminmultipler)+1;

siz_w=size(wminmultipler)+1;


idlin_sim_TT_wmax=idlin_sim_TT(1:siz(2));
idlin_sim_TT_wmin=idlin_sim_TT(siz(2)+1:size(idlin_sim_TT));


idlin_sim_SS_wmax=idlin_sim_SS(1:siz(2));
idlin_sim_SS_wmin=idlin_sim_SS(siz(2)+1:size(idlin_sim_SS));


idlin_sim_FF_wmax=idlin_sim_FF(1:siz(2));
idlin_sim_FF_wmin=idlin_sim_FF(siz(2)+1:size(idlin_sim_FF));







idlin_sim_TT_w_wmax=idlin_sim_TT_w(1:siz(2));
idlin_sim_TT_w_wmin=idlin_sim_TT_w(siz(2)+1:size(idlin_sim_TT_w));


idlin_sim_SS_w_wmax=idlin_sim_SS_w(1:siz(2));
idlin_sim_SS_w_wmin=idlin_sim_SS_w(siz(2)+1:size(idlin_sim_SS_w));


idlin_sim_FF_w_wmax=idlin_sim_FF_w(1:siz(2));
idlin_sim_FF_w_wmin=idlin_sim_FF_w(siz(2)+1:size(idlin_sim_FF_w));









idsat_sim_TT_wmax=idsat_sim_TT(1:siz(2));
idsat_sim_TT_wmin=idsat_sim_TT(siz(2)+1:size(idsat_sim_TT));


idsat_sim_SS_wmax=idsat_sim_SS(1:siz(2));
idsat_sim_SS_wmin=idsat_sim_SS(siz(2)+1:size(idsat_sim_SS));


idsat_sim_FF_wmax=idsat_sim_FF(1:siz(2));
idsat_sim_FF_wmin=idsat_sim_FF(siz(2)+1:size(idsat_sim_FF));








idsat_sim_TT_w_wmax=idsat_sim_TT_w(1:siz(2));
idsat_sim_TT_w_wmin=idsat_sim_TT_w(siz(2)+1:size(idsat_sim_TT_w));


idsat_sim_SS_w_wmax=idsat_sim_SS_w(1:siz(2));
idsat_sim_SS_w_wmin=idsat_sim_SS_w(siz(2)+1:size(idsat_sim_SS_w));


idsat_sim_FF_w_wmax=idsat_sim_FF_w(1:siz(2));
idsat_sim_FF_w_wmin=idsat_sim_FF_w(siz(2)+1:size(idsat_sim_FF_w));





vtlin_sim_TT_wmax=vtlin_sim_TT(1:siz(2));
vtlin_sim_TT_wmin=vtlin_sim_TT(siz(2)+1:size(vtlin_sim_TT));


vtlin_sim_SS_wmax=vtlin_sim_SS(1:siz(2));
vtlin_sim_SS_wmin=vtlin_sim_SS(siz(2)+1:size(vtlin_sim_SS));


vtlin_sim_FF_wmax=vtlin_sim_FF(1:siz(2));
vtlin_sim_FF_wmin=vtlin_sim_FF(siz(2)+1:size(vtlin_sim_FF));






vtlin_sim_TT_w_wmax=vtlin_sim_TT_w(1:siz(2));
vtlin_sim_TT_w_wmin=vtlin_sim_TT_w(siz(2)+1:size(vtlin_sim_TT_w));


vtlin_sim_SS_w_wmax=vtlin_sim_SS_w(1:siz(2));
vtlin_sim_SS_w_wmin=vtlin_sim_SS_w(siz(2)+1:size(vtlin_sim_SS_w));


vtlin_sim_FF_w_wmax=vtlin_sim_FF_w(1:siz(2));
vtlin_sim_FF_w_wmin=vtlin_sim_FF_w(siz(2)+1:size(vtlin_sim_FF_w));







vtsat_sim_TT_wmax=vtsat_sim_TT(1:siz(2));
vtsat_sim_TT_wmin=vtsat_sim_TT(siz(2)+1:size(vtsat_sim_TT));


vtsat_sim_SS_wmax=vtsat_sim_SS(1:siz(2));
vtsat_sim_SS_wmin=vtsat_sim_SS(siz(2)+1:size(vtsat_sim_SS));


vtsat_sim_FF_wmax=vtsat_sim_FF(1:siz(2));
vtsat_sim_FF_wmin=vtsat_sim_FF(siz(2)+1:size(vtsat_sim_FF));






vtsat_sim_TT_w_wmax=vtsat_sim_TT_w(1:siz(2));
vtsat_sim_TT_w_wmin=vtsat_sim_TT_w(siz(2)+1:size(vtsat_sim_TT_w));


vtsat_sim_SS_w_wmax=vtsat_sim_SS_w(1:siz(2));
vtsat_sim_SS_w_wmin=vtsat_sim_SS_w(siz(2)+1:size(vtsat_sim_SS_w));


vtsat_sim_FF_w_wmax=vtsat_sim_FF_w(1:siz(2));
vtsat_sim_FF_w_wmin=vtsat_sim_FF_w(siz(2)+1:size(vtsat_sim_FF_w));



x_axis = ln_sim_fin;

x_axis_w = wn_sim_fin;


% y_axis_idlin = idlin_sim_TT_wmax;

% ***************** Plot Graph ***************** %
% figure(1)
% % subplot(2,2,1);
% plot(x_axis, idlin_sim_TT_wmax);
% xlabel('ln');
% ylabel('Idlin');
% title('Idlin vs L W=Wmax');
% saveas(gcf,'idlin_vs_L_graph.png')
% %legend('idlin_TT', 'Location','NorthEastOutside')
% legend('idlin_TT')
% 
% hold on;
% 
% plot(x_axis, idlin_sim_SS_wmax);
% xlabel('ln');
% ylabel('Idlin');
% title('Idlin vs L W=Wmax');
% saveas(gcf,'idlin_vs_L_graph.png')
% %legend('idlin_SS', 'Location','NorthEastOutside')
% legend('idlin_SS')
% 
% hold on;
% 
% plot(x_axis, idlin_sim_FF_wmax);
% xlabel('ln');
% ylabel('Idlin');
% title('Idlin vs L W=Wmax');
% saveas(gcf,'idlin_vs_L_graph.jpeg')
% %legend('idlin_FF', 'Location','NorthEastOutside')
% legend('idlin_FF')
% 
% 
% hold off;


figure(1)

loglog(x_axis, idlin_sim_TT_wmax,x_axis, idlin_sim_SS_wmax,x_axis, idlin_sim_FF_wmax);
xlabel('Length(m)');
ylabel('Idlin(uA/um)');
title('Idlin vs L W=Wmax');
legend('TT','SS','FF')
grid on;
saveas(gcf,'idlin_vs_L_log_graph_wmax.jpeg')


figure(2)

semilogx(x_axis_w, idlin_sim_TT_w_wmax,x_axis_w, idlin_sim_SS_w_wmax,x_axis_w, idlin_sim_FF_w_wmax);
xlabel('Width(m)');
ylabel('Idlin(uA/um)');
title('Idlin vs W L=Lmax');
legend('TT','SS','FF')
grid on;
saveas(gcf,'idlin_vs_W_log_graph_wmax.jpeg')




figure(3)

loglog(x_axis, idlin_sim_TT_wmin,x_axis, idlin_sim_SS_wmin,x_axis, idlin_sim_FF_wmin);
xlabel('Length(m)');
ylabel('Idlin(uA/um)');
title('Idlin vs L W=Wmin');
legend('TT','SS','FF')
grid on;
saveas(gcf,'idlin_vs_L_log_graph_wmin.jpeg')




figure(4)

semilogx(x_axis_w, idlin_sim_TT_w_wmin,x_axis_w, idlin_sim_SS_w_wmin,x_axis_w, idlin_sim_FF_w_wmin);
xlabel('Length(m)');
ylabel('Idlin(uA/um)');
title('Idlin vs W L=Lmin');
legend('TT','SS','FF')
grid on;
saveas(gcf,'idlin_vs_W_log_graph_wmin.jpeg')





figure(5)

loglog(x_axis, idsat_sim_TT_wmax,x_axis, idsat_sim_SS_wmax,x_axis, idsat_sim_FF_wmax);
xlabel('Length(m)');
ylabel('Idsat(uA/um)');
title('Idsat vs L W=Wmax');
legend('TT','SS','FF')
grid on;
saveas(gcf,'idsat_vs_L_log_graph.jpeg')







figure(6)

semilogx(x_axis_w, idsat_sim_TT_w_wmax,x_axis_w, idsat_sim_SS_w_wmax,x_axis_w, idsat_sim_FF_w_wmax);
xlabel('Length(m)');
ylabel('Idsat(uA/um)');
title('Idsat vs W L=Lmax');
legend('TT','SS','FF')
grid on;
saveas(gcf,'idsat_vs_W_log_graph.jpeg')




figure(7)

loglog(x_axis, idsat_sim_TT_wmin,x_axis, idsat_sim_SS_wmin,x_axis, idsat_sim_FF_wmin);
xlabel('Length(m)');
ylabel('Idsat(uA/um)');
title('Idsat vs L W=Wmin');
legend('TT','SS','FF')
grid on;
saveas(gcf,'idsat_vs_L_log_graph_wmin.jpeg')







figure(8)

semilogx(x_axis_w, idsat_sim_TT_w_wmin,x_axis_w, idsat_sim_SS_w_wmin,x_axis_w, idsat_sim_FF_w_wmin);
xlabel('Length(m)');
ylabel('Idsat(uA/um)');
title('Idsat vs W L=Lmin');
legend('TT','SS','FF')
grid on;
saveas(gcf,'idsat_vs_W_log_graph_lmin.jpeg')








figure(9)

plot(x_axis, vtlin_sim_TT_wmax,x_axis, vtlin_sim_SS_wmax,x_axis, vtlin_sim_FF_wmax);
xlabel('Length(m)');
ylabel('Vtlin(V)');
title('Vtlin vs L W=Wmax');
legend('TT','SS','FF')
grid on;
saveas(gcf,'vtlin_vs_L_log_graph_wmax.jpeg')






figure(10)

plot(x_axis_w, vtlin_sim_TT_w_wmax,x_axis_w, vtlin_sim_SS_w_wmax,x_axis_w, vtlin_sim_FF_w_wmax);
xlabel('Width(m)');
ylabel('Vtlin(V)');
title('Vtlin vs W L=Lmax');
legend('TT','SS','FF')
grid on;
saveas(gcf,'vtlin_vs_W_log_graph_lmax.jpeg')





figure(11)

plot(x_axis, vtlin_sim_TT_wmin,x_axis, vtlin_sim_SS_wmin,x_axis, vtlin_sim_FF_wmin);
xlabel('Length(m)');
ylabel('Vtlin(V)');
title('Vtlin vs L W=Wmin');
legend('TT','SS','FF')
grid on;
saveas(gcf,'vtlin_vs_L_log_graph_wmin.jpeg')






figure(12)

plot(x_axis_w, vtlin_sim_TT_w_wmin,x_axis_w, vtlin_sim_SS_w_wmin,x_axis_w, vtlin_sim_FF_w_wmin);
xlabel('Width(m)');
ylabel('Vtlin(V)');
title('Vtlin vs W L=Lmin');
legend('TT','SS','FF')
grid on;
saveas(gcf,'vtlin_vs_W_log_graph_lmin.jpeg')





figure(13)

plot(x_axis, vtsat_sim_TT_wmax,x_axis, vtsat_sim_SS_wmax,x_axis, vtsat_sim_FF_wmax);
xlabel('Length(m)');
ylabel('Vtsat(V)');
title('Vtsat vs L W=Wmax');
legend('TT','SS','FF')
grid on;
saveas(gcf,'vtsat_vs_L_log_graph_wmax.jpeg')






figure(14)

plot(x_axis_w, vtsat_sim_TT_w_wmax,x_axis_w, vtsat_sim_SS_w_wmax,x_axis_w, vtsat_sim_FF_w_wmax);
xlabel('Width(m)');
ylabel('Vtsat(V)');
title('Vtsat vs W L=Lmax');
legend('TT','SS','FF')
grid on;
saveas(gcf,'vtsat_vs_W_log_graph_lmax.jpeg')





figure(15)

plot(x_axis, vtsat_sim_TT_wmin,x_axis, vtsat_sim_SS_wmin,x_axis, vtsat_sim_FF_wmin);
xlabel('Length(m)');
ylabel('Vtsat(V)');
title('Vtsat vs L W=Wmin');
legend('TT','SS','FF')
grid on;
saveas(gcf,'vtsat_vs_L_log_graph_wmin.jpeg')




figure(16)

plot(x_axis_w, vtsat_sim_TT_w_wmin,x_axis_w, vtsat_sim_SS_w_wmin,x_axis_w, vtsat_sim_FF_w_wmin);
xlabel('Length(m)');
ylabel('Vtsat(V)');
title('Vtsat vs L W=Wmin');
legend('TT','SS','FF')
grid on;
saveas(gcf,'vtsat_vs_L_log_graph_wmin.jpeg')


% 
% figure(2)
% % subplot(2,2,1);
% plot(x_axis, y_axis_idlin_abs, 'r');
% xlabel('ln');
% ylabel('idlin.abs');
% title('idlin.abs, ln vs m1');
% % saveas(gcf,'vth_l_idlin_abs_graph.png')
% legend('idlin.abs', 'Location','NorthEastOutside')
% 
% figure(3)
% % subplot(2,2,1);
% plot(x_axis, y_axis_idoff, 'g');
% xlabel('ln');
% ylabel('idoff');
% title('idoff, ln vs m1');
% % saveas(gcf,'vth_l_idoff_graph.png')
% legend('idoff', 'Location','NorthEastOutside')

