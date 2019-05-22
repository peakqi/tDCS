function d_create_ROI_for_La



im=qf_load('RGB_thr21_R_TP2_La.nii.gz');
RGBmask=single(im(:,:,:,1)>0|im(:,:,:,2)>0|im(:,:,:,3)>0);
whole=mask*0+1;
L=whole;R=whole;
L(92:182,:,:)=0;
R(1:91,:,:)=0;

%PFC

d_createROI_individual(maskfilename,RGBmask,ROIname6digit);
im=(qf_load('6r PFC R.nii.gz')+qf_load('6v PFC R.nii.gz'));
im=im/max(max(max(im)));
qf_save(im.*mask,'PFC_R.nii.gz')
temp=flip(im,1).*mask;
qf_save(temp,'PFC_L.nii.gz')


%BG

im=qf_load('BG caudalMotor.nii.gz');
im=im/max(max(max(im)));
qf_save(im.*mask.*R,'BGl_R.nii.gz')
qf_save(im.*mask.*L,'BGl_L.nii.gz')

function d_createROI_individual(maskfilename,RGBmask,ROIname)

BG caudalMotor.nii.gz
BG limbic.nii.gz
BG occipital.nii.gz
BG parietal.nii.gz
BG rostralMotor.nii.gz