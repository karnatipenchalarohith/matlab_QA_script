function filename = Generate_id_vd(lib,corner,modelname,W,L,m,nf,temperature,VGmax,VDD,VG_Step,GG_Start,GG_Stop,GG_Step,VD_VB,flag_fet,Terminals)
% BIAS

VDD = VDD;
VSS = '0';
VBB = '0';
VGG='GG';
VGmax=VGmax;

VG_Start='0';
VG_Stop='VGmax';

GG_Stop = 'VGmax';

% Device Dimensions
wn = W;
ln = L;
nf = nf;
m_1 = m;

% corner=corner2;
% lib=lib2;
%Terminals
%Terminals = 6;
Temperature = temperature;

%spl character


%Library
%lib = '/user/rkar/model_assessments/tc18c_model_update/model/all.scs';
%corner = 'TT_lib';

if VD_VB == '0'
    filename=['netlist_id_vd_vb0_' corner '.sp'];
else
    filename=['netlist_id_vd_' corner '.sp'];
    
end



fileID = fopen(filename,'w');


fprintf(fileID, '* Netlist\n\n');

fprintf(fileID, '.option brief\n');
fprintf(fileID, '.option ingold=2\n');

fprintf(fileID, '.param VDD= %s \n', VDD);

fprintf(fileID, '.param VSS= %s \n', VSS);

fprintf(fileID, '.param VBB= %s \n', VD_VB);

fprintf(fileID, '.param VGmax= %s \n', VGmax);

fprintf(fileID, '.param GG=%s \n', VG_Start);

fprintf(fileID, '.param wn = %s \n', wn);

fprintf(fileID, '.param ln = %s \n', ln);

fprintf(fileID, '.param m1 = %s \n', m_1);

fprintf(fileID, '.param nf1 = %s \n\n', nf);

% fprintf(fileID, '.param Wmin = %s \n',wmin);
% fprintf(fileID, '.param Wmax = %s \n',wmax);
% fprintf(fileID, '.param Lmin = %s \n',lmin);
% fprintf(fileID, '.param Lmax = %s \n\n',lmax);

if Terminals==5
    fprintf(fileID, 'm1  d g s b 0 %s w=wn l=ln m=m1  nf=nf1 \n\n', modelname);
elseif Terminals==6
    fprintf(fileID, 'm1  d g s b 0 0 %s w=wn l=ln m=m1  nf=nf1 \n\n', modelname);
else
    fprintf(fileID, 'm1  d g s b  %s w=wn l=ln m=m1  nf=nf1 \n\n', modelname);
end



fprintf(fileID, 'vd d 0 GG \n');

fprintf(fileID, 'vs s 0 VSS \n');

fprintf(fileID, 'vg g 0 GG \n');

fprintf(fileID, 'vb b 0 VBB \n\n');



fprintf(fileID, '.DC VDD %s %s %s sweep GG %s %s %s \n\n', VG_Start, VG_Stop, VG_Step,GG_Start, GG_Stop, GG_Step );

fprintf(fileID, '.temp %s \n', Temperature );

%fprintf(fileID, '.meas dc vtlin find par(''GG'') when par(''(abs(i(vd1)))'') = ''1e-7*(wn/ln)'' \n\n' );

%fprintf(fileID, '.meas dc Idsat_abs find par(''(abs(i(vd)))'') when par(''GG'')=VGmax \n\n' );

%fprintf(fileID, '.meas dc Idsat_nom find par(''(abs(i(vd))/(wn))'') when par(''GG'')=VGmax \n\n' );



fprintf(fileID, '.print par(''-1*i(vd)'')\n\n');


fprintf(fileID, '.lib ''%s'' %s \n\n', lib,corner);


fprintf(fileID, '.end \n' );






fclose(fileID);