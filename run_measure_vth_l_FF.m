% ***************** Read file from netlist_vth_l_FF_lib.measure ***************** %
filename_meas_FF = 'netlist_vth_l_FF_lib.measure';
fid_FF = fopen(filename_meas_FF,'r');

% text1_FF = textscan(fid_FF,'%s');
text1_FF = textscan(fid_FF,'%s','delimiter','\n');

text2_FF = text1_FF{1};



% ***************** Search for string containing 'id' ***************** %
id_mask_FF = ~cellfun(@isempty, strfind(text2_FF, 'id'));
id_line_FF = text2_FF(id_mask_FF);
id_split_FF = regexp(id_line_FF,'wn         @ ','split');



% ***************** Search for string containing 'vtlin' ***************** %
vtlin_mask_FF = ~cellfun(@isempty, strfind(text2_FF, 'vtlin'));
vtlin_line_FF = text2_FF(vtlin_mask_FF);
vtline_split_FF = regexp(vtlin_line_FF,'wn         @ ','split');



% ***************** Search for string containing 'vtsat' ***************** %
vtsat_mask_FF = ~cellfun(@isempty, strfind(text2_FF, 'vtsat'));
vtsat_line_FF = text2_FF(vtsat_mask_FF);
vtsat_split_FF = regexp(vtsat_line_FF,'wn         @ ','split');



% ***************** Conbine String for id, vtline, vtsat ***************** %
new_split_FF = [id_split_FF{:}, vtline_split_FF{:}, vtsat_split_FF{:}];

combine_new_split_FF = (vertcat(new_split_FF (1:2:end) ,new_split_FF (2:2:end)))';



% ***************** Search for string containing 'ln' ***************** %
ln_mask_FF = ~cellfun(@isempty, strfind(text2_FF, 'ln'));
ln_line_FF = text2_FF(ln_mask_FF);
ln_split_FF = regexp(ln_line_FF,'@ ','split');

new_ln_split_FF = [ln_split_FF{:}];
combine_new_ln_split_FF = (vertcat(new_ln_split_FF (2:2:end)))';



% ***************** Search for string containing 'm1' ***************** %
m1_mask_FF = ~cellfun(@isempty, strfind(text2_FF, 'm1'));
m1_line_FF = text2_FF(m1_mask_FF);
m1_split_FF = regexp(m1_line_FF,'=  ','split');

new_m1_split_FF = [m1_split_FF{:}];

combine_new_m1_split_FF = (vertcat(new_m1_split_FF (1:2:end), new_m1_split_FF (2:2:end)))';



% ***************** Conbine String for all variable ***************** %
combine_all_split_FF = [combine_new_split_FF combine_new_ln_split_FF combine_new_m1_split_FF];




% ***************** x-axis ***************** %
ln_x = (new_ln_split_FF (2:2:22))';

x_axis = str2double(ln_x);



% ***************** y-axis ***************** %
m1_idlin = (new_m1_split_FF (2:2:22))';

m1_idlin_abs = (new_m1_split_FF (24:2:44))';

m1_idoff = (new_m1_split_FF (46:2:66))';
% 
% m1_idoff_abs = (new_m1_split_FF (68:2:88))';
% 
% m1_idsat = (new_m1_split_FF (90:2:110))';
% 
% m1_idsat_abs = (new_m1_split_FF (112:2:132))';
% 
% m1_vtlin = (new_m1_split_FF (134:2:154))';
% 
% m1_vtsat = (new_m1_split_FF (156:2:176))';

% y_axis_value = (vertcat(new_m1_split_FF (2:2:22)))';

y_axis_idlin = str2double(m1_idlin);
y_axis_idlin_abs = str2double(m1_idlin_abs);
y_axis_idoff = str2double(m1_idoff);
% y_axis_idoff_abs = str2double(m1_idoff_abs);
% y_axis_idsat = str2double(m1_idsat);
% y_axis_idsat_abs = str2double(m1_idsat_abs);
% y_axis_vtlin = str2double(m1_vtlin);
% y_axis_vtsat = str2double(m1_vtsat);

% y_axis_all = [y_axis_idlin y_axis_idlin_abs y_axis_idoff y_axis_idoff_abs y_axis_idsat y_axis_idsat_abs y_axis_vtlin y_axis_vtsat];



% ***************** Plot Graph ***************** %
figure(1)
% subplot(2,2,1);
plot(x_axis, y_axis_idlin);
xlabel('ln');
ylabel('idlin');
title('idlin, ln vs m1');
saveas(gcf,'vth_l_idlin_graph.png')
legend('idlin', 'Location','NorthEastOutside')

figure(2)
% subplot(2,2,1);
plot(x_axis, y_axis_idlin_abs, 'r');
xlabel('ln');
ylabel('idlin.abs');
title('idlin.abs, ln vs m1');
% saveas(gcf,'vth_l_idlin_abs_graph.png')
legend('idlin.abs', 'Location','NorthEastOutside')

figure(3)
% subplot(2,2,1);
plot(x_axis, y_axis_idoff, 'g');
xlabel('ln');
ylabel('idoff');
title('idoff, ln vs m1');
% saveas(gcf,'vth_l_idoff_graph.png')
legend('idoff', 'Location','NorthEastOutside')

% figure(4)
% % subplot(2,2,1);
% loglog(x_axis, y_axis_all);
% xlabel('ln');
% ylabel('m1');
% title('loglog, ln vs m1');
% % saveas(gcf,'id_vg_graph(TTSSFF).png')
% % saveas(gcf,'id_vg_4combined_graph(TTSSFF).png')
% % legend('idlin','idlin.abs','idoff','idoff.abs','idsat','idsat.abs', 'vtlin','vtsat', 'Location','NorthEastOutside')
