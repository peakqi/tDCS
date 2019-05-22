function c2_RGB_figures_eachpatient(lrap,RealSham,patientNo,TP)



strcat('RGB_',RealSham,num2str(patientNo),'_',TP,'_',lrap,'.nii.gz')

R=qf_load(strcat('C_TP2_',lrap,'.nii.gz'));
G=qf_load(strcat(RealSham,num2str(patientNo),'_',TP,'_',lrap,'.nii.gz'));
B=qf_load(strcat(RealSham,num2str(patientNo),'_TP3_',lrap,'.nii.gz'));

thr=1.96;
im=cat(4,R,G,B);
% SliceBrowser(im);
%SliceBrowser(single(im>thr));
%qf_save(im,strcat('RGB_',RealSham,'_',TP,'_',lrap,'.nii.gz'))
qf_save(single(im>thr),strcat('RGB_thr196_',RealSham,num2str(patientNo),'_',TP,'_',lrap,'.nii.gz'))



% 
%     for ii=1:7
%     c2_RGB_figures_eachpatient('La','S',ii,'TP1')
%     c2_RGB_figures_eachpatient('Ra','S',ii,'TP1')
%     c2_RGB_figures_eachpatient('Lp','S',ii,'TP1')
%     c2_RGB_figures_eachpatient('Rp','S',ii,'TP1')
%     c2_RGB_figures_eachpatient('La','S',ii,'TP2')
%     c2_RGB_figures_eachpatient('Ra','S',ii,'TP2')
%     c2_RGB_figures_eachpatient('Lp','S',ii,'TP2')
%     c2_RGB_figures_eachpatient('Rp','S',ii,'TP2')
%     end
%     for ii=1:9
%     c2_RGB_figures_eachpatient('La','R',ii,'TP1')
%     c2_RGB_figures_eachpatient('Ra','R',ii,'TP1')
%     c2_RGB_figures_eachpatient('Lp','R',ii,'TP1')
%     c2_RGB_figures_eachpatient('Rp','R',ii,'TP1')
%     c2_RGB_figures_eachpatient('La','R',ii,'TP2')
%     c2_RGB_figures_eachpatient('Ra','R',ii,'TP2')
%     c2_RGB_figures_eachpatient('Lp','R',ii,'TP2')
%     c2_RGB_figures_eachpatient('Rp','R',ii,'TP2')
%     end