function c1_RGB_figures(lrap,RealSham,TP)


% strcat('C_TP2_',lrap,'.nii.gz')
% strcat(RealSham,'_',TP,'_',lrap,'.nii.gz')
% strcat(RealSham,'_TP3_',lrap,'.nii.gz')
strcat('RGB_',RealSham,'_',TP,'_',lrap,'.nii.gz')

R=qf_load(strcat('C_TP2_',lrap,'.nii.gz'));
G=qf_load(strcat(RealSham,'_',TP,'_',lrap,'.nii.gz'));
B=qf_load(strcat(RealSham,'_TP3_',lrap,'.nii.gz'));

thr=1.96;
im=cat(4,R,G,B);
% SliceBrowser(im);
SliceBrowser(single(im>thr));
qf_save(im,strcat('RGB_',RealSham,'_',TP,'_',lrap,'.nii.gz'))
qf_save(single(im>thr),strcat('RGB_thr196_',RealSham,'_',TP,'_',lrap,'.nii.gz'))

% c1_RGB_figures('La','R','TP1')
% c1_RGB_figures('La','S','TP1')
% 
% c1_RGB_figures('La','R','TP2')
% c1_RGB_figures('La','S','TP2')
% 
% c1_RGB_figures('Ra','R','TP1')
% c1_RGB_figures('Ra','S','TP1')
% 
% c1_RGB_figures('Ra','R','TP2')
% c1_RGB_figures('Ra','S','TP2')
% 
% c1_RGB_figures('Lp','R','TP1')
% c1_RGB_figures('Lp','S','TP1')
% 
% c1_RGB_figures('Lp','R','TP2')
% c1_RGB_figures('Lp','S','TP2')
% 
% c1_RGB_figures('Rp','R','TP1')
% c1_RGB_figures('Rp','S','TP1')
% 
% c1_RGB_figures('Rp','R','TP2')
% c1_RGB_figures('Rp','S','TP2')


