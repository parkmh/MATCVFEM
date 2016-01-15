Ver = 1.0;
user = 'Minho Park';
email = 'min.park@nottingham.ac.uk';

clc
fprintf(' ********************************************\n')
fprintf('\n')
fprintf(' Matlab Control Volume Finite Element Method Toolbox  %s \n',Ver) 
fprintf('\n')
fprintf('%20s %s\n','Written by', user);
fprintf('%13s %s\n','email :',email);
fprintf(' ********************************************\n')

cwd = pwd;
cvfemroot = cwd;

% Add path
addpath(cvfemroot);
savepath;


fprintf('Finished!!!\n')