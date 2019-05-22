function c6_tstats_barchart_cmp
format short
load patientinfo
maskname{1}='mask_rightmotor.nii.gz';Z{1}=130;
maskname{2}='mask_left_motor.nii.gz';Z{2}=130;
maskname{3}='mask_rightcereb.nii.gz';Z{3}=50;
maskname{4}='mask_left_cereb.nii.gz';Z{4}=50;
lrap{1}='La'; 
lrap{2}='Ra';
lrap{3}='Lp';
lrap{4}='Rp';

l{1}='Black'; l{2}='Red'; l{3}='Green'; l{4}='Yellow'; 
l{5}='Blue'; l{6}='Purple'; l{7}='Cyan'; l{8}='White'; 
ll{1}='Real-TP1'; ll{2}='Real-TP2'; ll{3}='Sham-TP1'; ll{4}='Sham-TP2';

MNI=qf_load('MNI152_T1_1mm_brain.nii.gz');
for jj=1:4
   for ii=1:4 %mask index     
       Mask=qf_load(maskname{ii});
       load(strcat('RGB_thr196_R_TP1_',lrap{jj},'_',maskname{ii}(6:15),'.mat'))
       R1= RGBstatics;
       load(strcat('RGB_thr196_S_TP1_',lrap{jj},'_',maskname{ii}(6:15),'.mat'))
       S1= RGBstatics; 
       load(strcat('RGB_thr196_R_TP2_',lrap{jj},'_',maskname{ii}(6:15),'.mat'))
       R2= RGBstatics;
       load(strcat('RGB_thr196_S_TP2_',lrap{jj},'_',maskname{ii}(6:15),'.mat'))
       S2= RGBstatics;
       
       r1=mean(R1,1);
       s1=mean(S1,1);
       r2=mean(R2,1);
       s2=mean(S2,1);
       
       stdr1=std(R1,1);
       stds1=std(R1,1);
       stdr2=std(R2,1);
       stds2=std(R2,1);
       catR=cat(1,R1,R2);
       catS=cat(1,S1,S2);
      
       [h1,p]=ttest2(catR,catS,'Tail','right')
       
       mean1=cat(1,r1,r2,s1,s2);
       std1=cat(1,stdr1,stdr2,stds1,stds2);
        nomask=single(MNI)/8364.*(1-Mask);
        imm2=cat(4,nomask,nomask,nomask);  
       
        figure
        subplot(3,2,1);
        im=qf_load( strcat('RGB_thr196_R_TP1_',lrap{jj},'.nii.gz'));
        imm=cat(4,im(:,:,:,1).*Mask,im(:,:,:,2).*Mask,im(:,:,:,3).*Mask);
        imm=imm+imm2;
        R1imm=imm;
        aa=squeeze(imm(:,:,Z{ii},:));
        aa=flipud(permute(aa,[2,1,3]));
        imshow( aa);
        title('Real TP1')
        
        subplot(3,2,3);
        im=qf_load( strcat('RGB_thr196_R_TP2_',lrap{jj},'.nii.gz'));
        imm=cat(4,im(:,:,:,1).*Mask,im(:,:,:,2).*Mask,im(:,:,:,3).*Mask);
        imm=imm+imm2;
        R2imm=imm;
        aa=squeeze(imm(:,:,Z{ii},:));
        aa=flipud(permute(aa,[2,1,3]));
        imshow( aa);
        title('Real TP2')
        
        subplot(3,2,2);
        im=qf_load( strcat('RGB_thr196_S_TP1_',lrap{jj},'.nii.gz'));
        imm=cat(4,im(:,:,:,1).*Mask,im(:,:,:,2).*Mask,im(:,:,:,3).*Mask);
        imm=imm+imm2;
        S1imm=imm;
        aa=squeeze(imm(:,:,Z{ii},:));
        aa=flipud(permute(aa,[2,1,3]));
        imshow( aa);
        title('sham TP1')
        
        subplot(3,2,4);
        im=qf_load( strcat('RGB_thr196_S_TP2_',lrap{jj},'.nii.gz'));
        imm=cat(4,im(:,:,:,1).*Mask,im(:,:,:,2).*Mask,im(:,:,:,3).*Mask);
        imm=imm+imm2;
        S2imm=imm;
        aa=squeeze(imm(:,:,Z{ii},:));
        aa=flipud(permute(aa,[2,1,3]));
        imshow( aa);
         title('sham TP2')

        subplot(3,2,[5,6]);
        h=bar(mean1')
        legend(ll)
%        hold on
%        h1=errorbar(mean1',std1')    
       set(gca,'xticklabel', l) 
       legend()
       title(strcat(lrap{jj},'--',maskname{ii}(6:15)))
       savefig(strcat('thr196_barchart_',lrap{jj},'_',maskname{ii}(6:15),'.fig'))
       h1,p
       save(strcat('thr196_barchart_ttest2_',lrap{jj},'_',maskname{ii}(6:15),'.mat'),'p','h1');
       %SliceBrowser(R1imm);SliceBrowser(R2imm);SliceBrowser(S1imm);SliceBrowser(S2imm);
       
       
   end
end

