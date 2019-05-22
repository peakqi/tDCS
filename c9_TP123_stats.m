function [c,d]=c9_TP123_stats(lrap,ii)

maskname{1}='mask_rightmotor.nii.gz';
maskname{2}='mask_left_motor.nii.gz';
maskname{3}='mask_rightcereb.nii.gz';
maskname{4}='mask_left_cereb.nii.gz';

MN=maskname{ii}(6:15);
load (strcat('RGB_thr21_R_TP1_',lrap,'_',MN,'.mat'));
Rtp1=RGBstatics;
load (strcat('RGB_thr21_R_TP2_',lrap,'_',MN,'.mat'));
Rtp2=RGBstatics;
load (strcat('RGB_thr21_S_TP1_',lrap,'_',MN,'.mat'));
Stp1=RGBstatics;
load (strcat('RGB_thr21_S_TP2_',lrap,'_',MN,'.mat'));
Stp2=RGBstatics;

R1=Rtp1(:,3)+Rtp1(:,4)+Rtp1(:,7)+Rtp1(:,8);
R2=Rtp2(:,3)+Rtp2(:,4)+Rtp2(:,7)+Rtp2(:,8);
R3=Rtp1(:,5)+Rtp1(:,6)+Rtp1(:,7)+Rtp1(:,8);
R3p=Rtp2(:,5)+Rtp2(:,6)+Rtp2(:,7)+Rtp2(:,8);

S1=Stp1(:,3)+Stp1(:,4)+Stp1(:,7)+Stp1(:,8);
S2=Stp2(:,3)+Stp2(:,4)+Stp2(:,7)+Stp2(:,8);
S3=Stp1(:,5)+Stp1(:,6)+Stp1(:,7)+Stp1(:,8);
S3p=Stp2(:,5)+Stp2(:,6)+Stp2(:,7)+Stp2(:,8);
R=cat(2, R1,R2,R3);
Rmean=mean(R,1);
Rstd=std(R,1)/3;
S=cat(2,S1,S2,S3);
Smean=mean(S,1);
Sstd=std(S,1)/sqrt(7);
d=cat(1, R,Rmean,Rstd,Rmean*0-999,S,Smean,Sstd);
figure
c=cat(2,mean(R1),mean(S1),mean(R2),mean(S2),mean(R3),mean(S3));
bar(c)

