function [idlin_sim,idsat_sim,vtlin_sim,vtsat_sim,ln_sim_fin,wn_sim_fin] = read_sim_idsat(filename_meas,corner,lminmultipler)

filename_meas_FF = 'netlist_vth_l_FF_lib.measure';
% filename_meas = 'netlist_vth_l_FF_lib.measure';

%filename_meas=[netlist_name '.measure'];

fid = fopen(filename_meas,'r');
text = textscan(fid,'%s');
text2=text{1};


Index_meas_ln_c = strfind(text2,'ln');
Index_meas_ln = find(not(cellfun('isempty',Index_meas_ln_c)))


ln_sim=str2double(text2(Index_meas_ln+2));

siz1=size(lminmultipler)+1;

ln_sim_fin=ln_sim(1:siz1(2));






Index_meas_wn_c = strfind(text2,'wn');
Index_meas_wn = find(not(cellfun('isempty',Index_meas_wn_c)))


wn_sim=str2double(text2(Index_meas_wn+2));

siz1=size(lminmultipler)+1;

wn_sim_fin=wn_sim(1:siz1(2));








Index_meas_idsat_c = strfind(text2,'idsat');
Index_meas_idsat = find(not(cellfun('isempty',Index_meas_idsat_c)))


idsat_sim=str2double(text2(Index_meas_idsat+11));


idsat_sim



Index_meas_idlin_c = strfind(text2,'idlin');
Index_meas_idlin = find(not(cellfun('isempty',Index_meas_idlin_c)))


idlin_sim=str2double(text2(Index_meas_idlin+11));



Index_meas_vtlin_c = strfind(text2,'vtlin');
Index_meas_vtlin = find(not(cellfun('isempty',Index_meas_vtlin_c)))

vtlin_sim=str2double(text2(Index_meas_vtlin+11));



Index_meas_vtsat_c = strfind(text2,'vtsat');
Index_meas_vtsat = find(not(cellfun('isempty',Index_meas_vtsat_c)))

vtsat_sim=str2double(text2(Index_meas_vtsat+11));




