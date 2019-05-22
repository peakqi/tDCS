function e=ca_double_barchart(lrap,ii)

maskname{1}='mask_rightmotor.nii.gz';
maskname{2}='mask_left_motor.nii.gz';
maskname{3}='mask_rightcereb.nii.gz';
maskname{4}='mask_left_cereb.nii.gz';



load (strcat('RGB_thr196_R_TP1_',lrap,'_',maskname{ii}(6:15),'.mat'))
R1=RGBstatics;
R1mean=mean(R1,1);
R1std=std(R1,1)/3;
load (strcat('RGB_thr196_R_TP2_',lrap,'_',maskname{ii}(6:15),'.mat'))
R2=RGBstatics;
R2mean=mean(R2,1);
R2std=std(R2,1)/3;

load (strcat('RGB_thr196_S_TP1_',lrap,'_',maskname{ii}(6:15),'.mat'))
S1=RGBstatics;
S1mean=mean(S1,1);
S1std=std(S1,1)/sqrt(7);
load (strcat('RGB_thr196_S_TP2_',lrap,'_',maskname{ii}(6:15),'.mat'))
S2=RGBstatics;
S2mean=mean(S2,1);
S2std=std(S2,1)/sqrt(7);
[h1,p]=ttest2(cat(1,R1,R2),cat(1,S1,S2),'Vartype','unequal','Tail','right')
[h1,p]=ttest2(cat(1,R1,R2),cat(1,S1,S2),'Vartype','unequal','Tail','left')
e=single(cat(1,R1,R1mean,R1std,R1mean*0-999,R2,R2mean,R2std,R1mean*0-999,...
    S1,S1mean,S1std,S1mean*0-999,S2,S2mean,S2std));