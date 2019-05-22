function c7_validate_RGBstats(lrap,RealSham,patientNo,TP,ii)

maskname{1}='mask_rightmotor.nii.gz';Z{1}=130;
maskname{2}='mask_left_motor.nii.gz';Z{2}=130;
maskname{3}='mask_rightcereb.nii.gz';Z{3}=50;
maskname{4}='mask_left_cereb.nii.gz';Z{4}=50;

l{1}='Black'; l{2}='Red'; l{3}='Green'; l{4}='Yellow'; 
l{5}='Blue'; l{6}='Purple'; l{7}='Cyan'; l{8}='White'; 


strcat('RGB_',RealSham,num2str(patientNo),'_',TP,'_',lrap,'.nii.gz')

R=qf_load(strcat('C_TP2_',lrap,'.nii.gz'));
G=qf_load(strcat(RealSham,num2str(patientNo),'_',TP,'_',lrap,'.nii.gz'));
B=qf_load(strcat(RealSham,num2str(patientNo),'_TP3_',lrap,'.nii.gz'));
mask=qf_load(maskname{ii});
MNI=qf_load('MNI.nii.gz');
thr=2.1;
im=cat(4,R,G,B);
im=single(im>thr);
RGBstatics =c4_calculate_voxels(im(:,:,:,1),im(:,:,:,2),im(:,:,:,3),mask);
        figure
       
        subplot(2,2,1);
        imm=cat(4,im(:,:,:,1).*mask,im(:,:,:,2).*mask,im(:,:,:,3).*mask);
        nomask=single(MNI)/8364.*(1-mask);
        imm2=cat(4,nomask,nomask,nomask);
        imm=imm+imm2;
        aa=squeeze(imm(:,:,Z{ii},:));
        aa=flipud(permute(aa,[2,1,3]));
        imshow( aa);
        title(strcat(RealSham,num2str(patientNo),'-',TP,'-',lrap,'-',maskname{ii}(6:15)))
         
         subplot(2,2,2);
        imm=cat(4,im(:,:,:,1).*mask,im(:,:,:,2).*mask,im(:,:,:,3).*mask);
        nomask=single(MNI)/8364.*(1-mask);
        imm2=cat(4,nomask,nomask,nomask);
        imm=imm+imm2;
        aa=squeeze(imm(:,:,Z{ii}-10,:));
        aa=flipud(permute(aa,[2,1,3]));
        imshow( aa);
        title(strcat(RealSham,num2str(patientNo),'-',TP,'-',lrap,'-',maskname{ii}(6:15)))
         
        
        subplot(2,2,[3,4]);
        h=bar(RGBstatics') 
        set(gca,'xticklabel', l) 
        SliceBrowser(imm)
% SliceBrowser(im);
%SliceBrowser(single(im>thr));
%qf_save(im,strcat('RGB_',RealSham,'_',TP,'_',lrap,'.nii.gz'))
% qf_save(single(im>thr),strcat('RGB_thr21_',RealSham,num2str(patientNo),'_',TP,'_',lrap,'.nii.gz'))


