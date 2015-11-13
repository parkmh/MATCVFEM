function vc = void_content(opt)
V = total_volume(opt);
vc = (V - sum(opt.cvfem.fFactor.*opt.cvfem.V))/V *100;