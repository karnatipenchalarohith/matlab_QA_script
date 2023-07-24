% Please fill items in line
clear all;
path=pwd;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% start of fill %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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


% NMOSI device
% pls fill library path and corners
lib = '/user/rkar/data_from_tp/Matlab_Environment_For_Modeling/Matlab_environement_psp/pmos1v_dnw_rev4/corner/all.scs';
corner = {'TT_lib','SS_lib','FF_lib'};


% Pls enter the gds targets
gds_silicon = [1.2 0.75 1.65];

% Pls fill monte-carlo runs and no. of runs
monte_corner = 'mc_lib';
monteruns = '300';

% Pls enter the model name
modelname='pmos1v_dnw';

% Pls enter the model dimensions
W='9u';
L='0.117u';
m='1';
nf='1';

% Dimension Range in um
wmin = '0.135u';
wmax = '100u';
lmin = '0.117u';
lmax = '100u';

pos_wmin_u=regexp(wmin, 'u', 'once');

if pos_wmin_u
    wmin(pos_wmin_u)='e';
    wmin(pos_wmin_u+1)='-';
    wmin(pos_wmin_u+2)='6';
end

pos_wmax_u=regexp(wmax, 'u', 'once');

if pos_wmax_u
    wmax(pos_wmax_u)='e';
    wmax(pos_wmax_u+1)='-';
    wmax(pos_wmax_u+2)='6';
end

pos_lmax_u=regexp(lmax, 'u', 'once');

if pos_lmax_u
    lmax(pos_lmax_u)='e';
    lmax(pos_lmax_u+1)='-';
    lmax(pos_lmax_u+2)='6';
end

pos_lmin_u=regexp(lmin, 'u', 'once');

if pos_lmin_u
    lmin(pos_lmin_u)='e';
    lmin(pos_lmin_u+1)='-';
    lmin(pos_lmin_u+2)='6';
end

% Pls enter the temperature
temperature='25';
temp_start = '-40';
temp_stop = '175';

% Pls enter the Bias. (e.g.) VGmax = 3.3 for NMOS VGS= -3.3 for PMOS
VGmax='1.2';
VG_Step='0.01';
VDmax='1.2';
VDD='1.2';
VDlin = '0.1';
vds_gds = '0.8';
vdd_sat = '1.32';

%ib_vg
VDD_sub_Start = '3';
VDD_sub_End = '3.6';
VDD_sub_Step = '0.3';

%ig_vg
VDD_ig_Start = '-0';
VDD_ig_Stop = '-3';
VDD_ig_Step = '-0.5';

%id_vg
VBB_Start = '0';
VBB_Stop = '1.2';
VBB_Step = '0.5';

%id_vd
GG_Start = '-0.9';
GG_Stop = VGmax;
GG_Step = '-0.6';
VD_VB = '0';

VD_VB_high = '-3';


% Pls enter the no. of terminals
Terminals=4;

% Pls enter the iref for Vth calculations
iref='1e-7';

% Pls enter the flag. Flag_fet = 1 for NMOS and Flag_fet=-1 for PMOS.
flag_fet = -1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of fill %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% xyz = [];
% file_netlist1_1=[];


for i=1:length(corner)
   % for a=1:1:2
%    file_netlist1_1{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmax,lmax,m,nf,temperature,VGmax,VDD,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);

      file_netlist1_1{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmax,lmax,m,nf,temperature,VGmax,VDD,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);

      eval(['!spectre ' path '/'  file_netlist1_1{i}]);
    
    %      file_netlist2_1{a}{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmax,lmax,m,nf,temperature,VGmax,VDlin,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);
%     file_netlist3_1{i} = Generate_id_vd(lib,char(corner(i)),modelname,wmax,lmax,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB,flag_fet,Terminals);
%     file_netlist4_1{i} = Generate_id_vd(lib,char(corner(i)),modelname,wmax,lmax,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB_high,flag_fet,Terminals);
%     file_netlist5_1{i} = Generate_ib_vg(lib,char(corner(i)),modelname,wmax,lmax,m,nf,temperature,VGmax,VDD,VG_Step,VDD_sub_Start,VDD_sub_End,VDD_sub_Step,flag_fet,Terminals);
%     file_netlist6_1{i} = Generate_ig_vg(lib,char(corner(i)),modelname,wmax,lmax,m,nf,temperature,VGmax,VDD,VG_Step,VDD_ig_Start,VDD_ig_Stop,VDD_ig_Step,flag_fet,Terminals);
%     
%     
%     file_netlist1_2{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmax,lmin,m,nf,temperature,VGmax,VDD,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);
%     file_netlist2_2{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmax,lmin,m,nf,temperature,VGmax,VDlin,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);
%     file_netlist3_2{i} = Generate_id_vd(lib,char(corner(i)),modelname,wmax,lmin,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB,flag_fet,Terminals);
%     file_netlist4_2{i} = Generate_id_vd(lib,char(corner(i)),modelname,wmax,lmin,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB_high,flag_fet,Terminals);
%     file_netlist5_2{i} = Generate_ib_vg(lib,char(corner(i)),modelname,wmax,lmin,m,nf,temperature,VGmax,VDD,VG_Step,VDD_sub_Start,VDD_sub_End,VDD_sub_Step,flag_fet,Terminals);
%     file_netlist6_2{i} = Generate_ig_vg(lib,char(corner(i)),modelname,wmax,lmin,m,nf,temperature,VGmax,VDD,VG_Step,VDD_ig_Start,VDD_ig_Stop,VDD_ig_Step,flag_fet,Terminals);
%     
%     
%     
%     file_netlist1_3{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmin,lmax,m,nf,temperature,VGmax,VDD,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);
%     file_netlist2_3{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmin,lmax,m,nf,temperature,VGmax,VDlin,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);
%     file_netlist3_3{i} = Generate_id_vd(lib,char(corner(i)),modelname,wmin,lmax,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB,flag_fet,Terminals);
%     file_netlist4_3{i} = Generate_id_vd(lib,char(corner(i)),modelname,wmin,lmax,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB_high,flag_fet,Terminals);
%     file_netlist5_3{i} = Generate_ib_vg(lib,char(corner(i)),modelname,wmin,lmax,m,nf,temperature,VGmax,VDD,VG_Step,VDD_sub_Start,VDD_sub_End,VDD_sub_Step,flag_fet,Terminals);
%     file_netlist6_3{i} = Generate_ig_vg(lib,char(corner(i)),modelname,wmin,lmax,m,nf,temperature,VGmax,VDD,VG_Step,VDD_ig_Start,VDD_ig_Stop,VDD_ig_Step,flag_fet,Terminals);
%     
%     
%     
%     file_netlist1_4{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmin,lmin,m,nf,temperature,VGmax,VDD,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);
%     file_netlist2_4{i} = Generate_id_vg(lib,char(corner(i)),modelname,wmin,lmin,m,nf,temperature,VGmax,VDlin,VG_Step,VBB_Start,VBB_Stop,VBB_Step,flag_fet,Terminals);
%     file_netlist3_4{i} = Generate_id_vd(lib,char(corner(i)),modelname,wmin,lmin,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB,flag_fet,Terminals);
%     file_netlist4_4{i} = Generate_id_vd(lib,char(corner(i)),modelname,wmin,lmin,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB_high,flag_fet,Terminals);
%     file_netlist5_4{i} = Generate_ib_vg(lib,char(corner(i)),modelname,wmin,lmin,m,nf,temperature,VGmax,VDD,VG_Step,VDD_sub_Start,VDD_sub_End,VDD_sub_Step,flag_fet,Terminals);
%     file_netlist6_4{i} = Generate_ig_vg(lib,char(corner(i)),modelname,wmin,lmin,m,nf,temperature,VGmax,VDD,VG_Step,VDD_ig_Start,VDD_ig_Stop,VDD_ig_Step,flag_fet,Terminals);
%     
%     
%     
%     file_netlist7{i} = Generate_vth_l(lib,char(corner(i)),modelname,W,L,m,temperature,VGmax,VDD,VG_Step,VDlin,vdd_sat,wmin,wmax,lmin,lmax,flag_fet,Terminals);
%     file_netlist8{i} = Generate_vth_w(lib,char(corner(i)),modelname,W,L,m,temperature,VGmax,VDD,VG_Step,VDlin,vdd_sat,wmin,wmax,lmin,lmax,flag_fet,Terminals);
%     file_netlist9{i} = Generate_vth_t(lib,char(corner(i)),modelname,W,L,m,temperature,temp_start,temp_stop,VGmax,VDD,VG_Step,VDlin,vdd_sat,flag_fet,Terminals);
%     
 %    eval(['!spectre ' path '/'  file_netlist1_1{i}]);
%     eval(['!spectre ' path '/' file_netlist2_1{i}]);
%     eval(['!spectre ' path '/' file_netlist3_1{i}]);
%     eval(['!spectre ' path '/' file_netlist4_1{i}]);
%     eval(['!spectre ' path '/' file_netlist5_1{i}]);S
%     eval(['!spectre ' path '/' file_netlist6_1{i}]);
%     
%     eval(['!spectre ' path '/' file_netlist1_2{i}]);
%     eval(['!spectre ' path '/' file_netlist2_2{i}]);
%     eval(['!spectre ' path '/' file_netlist3_2{i}]);
%     eval(['!spectre ' path '/' file_netlist4_2{i}]);
%     eval(['!spectre ' path '/' file_netlist5_2{i}]);
%     eval(['!spectre ' path '/' file_netlist6_2{i}]);
%     
%     eval(['!spectre ' path '/' file_netlist1_3{i}]);
%     eval(['!spectre ' path '/' file_netlist2_3{i}]);
%     eval(['!spectre ' path '/' file_netlist3_3{i}]);
%     eval(['!spectre ' path '/' file_netlist4_3{i}]);
%     eval(['!spectre ' path '/' file_netlist5_3{i}]);
%     eval(['!spectre ' path '/' file_netlist6_3{i}]);
%     
%     eval(['!spectre ' path '/' file_netlist1_4{i}]);
%     eval(['!spectre ' path '/' file_netlist2_4{i}]);
%     eval(['!spectre ' path '/' file_netlist3_4{i}]);
%     eval(['!spectre ' path '/' file_netlist4_4{i}]);
%     eval(['!spectre ' path '/' file_netlist5_4{i}]);
%     eval(['!spectre ' path '/' file_netlist6_4{i}]);
%     
%     eval(['!spectre ' path '/' file_netlist7{i}]);
%     eval(['!spectre ' path '/' file_netlist8{i}]);
%     eval(['!spectre ' path '/' file_netlist9{i}]);

end

