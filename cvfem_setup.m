function opt = cvfem_setup(mesh,bndry,vis,darcy,K)

opt.mesh = mesh;
opt.bndry = bndry;
opt.vis = vis;
opt.darcy = darcy;
inlet_location = str2func(opt.bndry.inlet_location_fname);
vent_location = str2func(opt.bndry.vent_location_fname);

opt.mesh.nnode = size(opt.mesh.node,1);
opt.mesh.nelem = size(opt.mesh.elem,1);


[opt.mesh.Cnode, opt.mesh.Celem, opt.mesh.has_node_i, opt.mesh.bnd_nodes ] ...
    =  fem2d_init_tri(opt.mesh.elem,opt.mesh.nnode);

opt.mesh.normal_vec = compute_normals(opt.mesh.elem,opt.mesh.node);

if size(K,2) == 1
    opt.cvfem.K = [K K zeros(opt.mesh.nelem,1)];
    opt.cvfem.ktype = 1;
elseif size(K,2) == 2
    opt.cvfem.K = [K zeros(opt.mesh.nelem,1)];
    opt.cvfem.ktype = 2;
elseif size(K,2) == 3
    opt.cvfem.K = K;
    opt.cvfem.ktype = 3;
else
    error('unsupported dimension of K!')
end

% compute volumes of the control volumes
opt.cvfem.V = compute_volumes(opt.mesh.node,opt.mesh.elem,opt.darcy.thickness);          

[opt.bndry.inlet_flag, opt.bndry.inlet_pos, opt.bndry.Dirichlet] ...
    = inlet_location(opt.mesh.node, opt.mesh.bnd_nodes);
[opt.bndry.vent_flag, opt.vent_elem] ...
    = vent_location(opt.mesh.node,opt.mesh.bnd_nodes);

% Nuemann boundary condition
opt.bndry.neumann_flag = find_nuemann_points(opt.mesh.bnd_nodes,opt.bndry.inlet_flag, opt.bndry.vent_flag);

