function init_cvfem2d()

%
% g_D.m
%
fid = fopen('g_D.m','w');
fprintf(fid,'function y = g_D(x)\n');
fprintf(fid,'%% Write your own code here\n');
fprintf(fid,'%%y = ones(size(x,1),1)*100000;\n');
fprintf(fid,'%%for i = 1 : length(y)\n');
fprintf(fid,'%%   if x(i,1) == 0\n');
fprintf(fid,'%%       y(i) = 600000;\n');
fprintf(fid,'%%   end\n');
fprintf(fid,'%%end\n');
fclose(fid);

%
% g_N.m
%
fid = fopen('g_N.m','w');
fprintf(fid,'function y = g_N(x)\n');
fprintf(fid,'%% Write your own code here\n');
fprintf(fid,'%%y = zeros(size(x,1),1);\n');
fclose(fid);

%
% run_simulation.m
%
fid = fopen('run_simulation.m','w');
fprintf(fid,'function opt =  run_simulation()\n');
fprintf(fid,'\n');
fprintf(fid,'mesh = %% \n\n');
fprintf(fid,'darcy.thickness = %%0.001; %% (meter)\n');
fprintf(fid,'darcy.mu        = %%.1;    %% viscosity (Pa.s)\n');
fprintf(fid,'darcy.phi       = %%.7;    %% porosity\n\n');
fprintf(fid,'vis.dumpIdx = 1;\n');
fprintf(fid,'vis.dumpFlag = %%false;\n');
fprintf(fid,'vis.filename = %%filename;\n');
fprintf(fid,'vis.last_timestep = 0;\n\n');
fprintf(fid,'bndry.gd_filename   = ''g_D'';\n');
fprintf(fid,'bndry.gn_filename   = ''g_N'';\n');
fprintf(fid,'bndry.pvent         = 100000;\n');
fprintf(fid,'bndry.pinlet        = 600000;\n');
fprintf(fid,'bndry.inlet_location_fname = ''inlet_location'';\n');
fprintf(fid,'bndry.vent_location_fname = ''vent_location'';\n\n');
fprintf(fid,'%%opt = cvfem_setup(mesh,bndry,vis,darcy);\n');

fprintf(fid,'%%K = 1e-8*ones(opt.mesh.nelem,1);\n');
fprintf(fid,'%%opt = setK(opt,K);\n');

fprintf(fid,'%%opt = cvfem2d(opt);\n');
fclose(fid);

%
% inlet_location.m
%
fid = fopen('inlet_location.m','w');
fprintf(fid,'function [inlet_flag, inlet_pos, Dirichlet] = inlet_location(node,bnd_node)\n');
fprintf(fid,'%%nnode = size(node,1);\n');
fprintf(fid,'%%nbnd_node = nnz(bnd_node);\n');
fprintf(fid,'%%inlet = zeros(nbnd_node,1);\n');
fprintf(fid,'%%inlet_idx = 0;\n');
fprintf(fid,'%%candidate = find(bnd_node);\n');
fprintf(fid,'%%for i = 1 : nbnd_node\n');
fprintf(fid,'%%    ci = candidate(i);\n');
fprintf(fid,'%%    if node(ci,1) == 0 \n');
fprintf(fid,'%%        inlet_idx = inlet_idx+1;\n');
fprintf(fid,'%%       inlet(inlet_idx) = ci;\n');
fprintf(fid,'%%    end\n');
fprintf(fid,'%%end\n');
fprintf(fid,'%%inlet_flag = sparse(nnode,1);\n');
fprintf(fid,'%%inlet_flag(inlet(1:inlet_idx)) = 1;\n');
fprintf(fid,'%%inlet_pos = node(inlet_flag==1,:);\n\n');
fprintf(fid,'%%Dirichlet =zeros(nnode,1);\n');
fprintf(fid,'%%Dirichlet(inlet_flag==1) = 1;\n');

fclose(fid);

%
% vent_location.m
%
fid = fopen('vent_location.m','w');
fprintf(fid,'function  [vent_flag, vent_elem] = vent_location(node,bnd_node)\n');
fprintf(fid,'%%nnode = size(node,1);\n\n');
fprintf(fid,'%%nbnd_node = nnz(bnd_node);\n');
fprintf(fid,'%%vent = zeros(nbnd_node,1);\n');
fprintf(fid,'%%vent_idx = 0;\n');
fprintf(fid,'%%candidate = find(bnd_node);\n');
fprintf(fid,'%%for i = 1 : nbnd_node\n');
fprintf(fid,'%%    ci = candidate(i);\n');
fprintf(fid,'%%    if node(ci,1) == 0.200000\n');
fprintf(fid,'%%        vent_idx = vent_idx+1;\n');
fprintf(fid,'%%        vent(vent_idx) = ci;\n');
fprintf(fid,'%%    end\n');
fprintf(fid,'%%end\n');
fprintf(fid,'%%vent_flag = sparse(nnode,1);\n');
fprintf(fid,'%%vent_flag(vent(1:vent_idx)) = 1;\n');
fprintf(fid,'%%vent_elem = 0;\n\n');


fclose(fid);
