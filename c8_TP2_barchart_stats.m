function c=c8_TP2_barchart_stats(lrap,ii)



maskname{1}='mask_rightmotor.nii.gz';
maskname{2}='mask_left_motor.nii.gz';
maskname{3}='mask_rightcereb.nii.gz';
maskname{4}='mask_left_cereb.nii.gz';


load (strcat('RGB_thr196_R_TP2_',lrap,'_',maskname{ii}(6:15),'.mat'))
R=RGBstatics;

Rmean=mean(R,1);
Rstd=std(R,1)/3;

load (strcat('RGB_thr196_S_TP2_',lrap,'_',maskname{ii}(6:15),'.mat'))
S=RGBstatics;
Smean=mean(S,1);
Sstd=std(S,1)/sqrt(7);

[h1,p]=ttest2(R,S,'Vartype','unequal')
c=single(cat(1,R,Rmean,Rstd,Rmean*0-999,S,Smean,Sstd,Rmean*0-999,h1,p));

