function c_start
thr=1.96

%?????? R_TP2_La.nii.gz')
 c0_average_RGB('S','TP2','La')
% c0_average_RGB('S','TP3','La')
% c0_average_RGB('S','TP2','Ra')
% c0_average_RGB('S','TP3','Ra')
% c0_average_RGB('R','TP2','La')
% c0_average_RGB('R','TP3','La')
% c0_average_RGB('R','TP2','Ra')
% c0_average_RGB('R','TP3','Ra')
% c0_average_RGB('C','TP2','La')
% c0_average_RGB('C','TP2','Ra')

% 
% %????RGB_thr196_R1_La.nii.gz
% c3_RGB_figures_group('R','La',thr)
% %c3_RGB_figures_group('R','Ra',thr)
% c3_RGB_figures_group('S','La',thr)
% %c3_RGB_figures_group('S','Ra',thr)

%??RGB_thr196_S_TP2_La_rightmotor.mat
mask{1}='rightmotor';
mask{2}='left_motor';
mask{3}='rightcereb';
mask{4}='left_cereb';
for ii=1:3:4
    c5_RGB_statistics('S','La',mask{ii},thr)
    %c5_RGB_statistics('S','Ra',mask{ii},thr)
    c5_RGB_statistics('R','La',mask{ii},thr)
    %c5_RGB_statistics('R','Ra',mask{ii},thr)
end

%??sig_blue
c6_tstats_barchart_cmp_TP2(thr)