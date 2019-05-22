function d1_create_allROI_for_La



%PFC
im=(qf_load('6r PFC R.nii.gz')+qf_load('6v PFC R.nii.gz'));
ROIname6digit='PFC___'
d_createROI_individual(im,ROIname6digit)



%BG
maskfile='BG caudalMotor.nii.gz';
ROIname6digit='BG_cM_';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)

maskfile='BG limbic.nii.gz';
ROIname6digit='BG_lim';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)


maskfile='BG occipital.nii.gz';
ROIname6digit='BG_lim';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)

maskfile='BG parietal.nii.gz';
ROIname6digit='BG_prt';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)


maskfile='BG rostralMotor.nii.gz';
ROIname6digit='BG_rM_';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)

% Tha

maskfile='Thala PriM.nii.gz';
ROIname6digit='Tha_M1';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)

maskfile='Thala S1.nii.gz';
ROIname6digit='Tha_M1';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)



maskfile='ThalaPFC.nii.gz';
ROIname6digit='ThaPFC';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)

maskfile='thala occipital.nii.gz';
ROIname6digit='ThaOcc';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)



maskfile='thala postparietal.nii.gz';
ROIname6digit='Thaprt';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)


maskfile='thalaPreM.nii.gz';
ROIname6digit='ThaPre';
im=qf_load(maskfile);
d_createROI_individual(im,ROIname6digit)

%
im=qf_load('GM Premotor cortex BA6 L.nii.gz')...
    +qf_load('GM Premotor cortex BA6 R.nii.gz');
ROIname6digit='Pre___';
d_createROI_individual(im,ROIname6digit)

%M1

im= qf_load('GM Primary motor cortex BA4a L.nii.gz')+...
    qf_load('GM Primary motor cortex BA4a R.nii.gz')+...
    qf_load('GM Primary motor cortex BA4p L.nii.gz')+...
    qf_load('GM Primary motor cortex BA4p R.nii.gz');
ROIname6digit='Pri___';
d_createROI_individual(im,ROIname6digit)


% insu
im= qf_load('GM Insula Id1 R.nii.gz')+...
    qf_load('GM Insula Id1 L.nii.gz')+...
    qf_load('GM Insula Ig1 R.nii.gz')+...
    qf_load('GM Insula Id1 L.nii.gz')+...
    qf_load('GM Insula Ig2 L.nii.gz')+...
    qf_load('GM Insula Ig2 R.nii.gz');
ROIname6digit='Ins___';
d_createROI_individual(im,ROIname6digit)
%S1
im= qf_load('GM Primary somatosensory cortex BA1 L.nii.gz')+...
    qf_load('GM Primary somatosensory cortex BA1 R.nii.gz')+...
    qf_load('GM Primary somatosensory cortex BA2 L.nii.gz')+...
    qf_load('GM Primary somatosensory cortex BA2 R.nii.gz')+...
    qf_load('GM Primary somatosensory cortex BA3a L.nii.gz')+...
    qf_load('GM Primary somatosensory cortex BA3a R.nii.gz')+...
    qf_load('GM Primary somatosensory cortex BA3b L.nii.gz')+...
    qf_load('GM Primary somatosensory cortex BA3b R.nii.gz');
ROIname6digit='S1____';
d_createROI_individual(im,ROIname6digit)


%parietal

im= qf_load('GM Superior parietal lobule 7A L.nii.gz')+...
    qf_load('GM Superior parietal lobule 7A R.nii.gz')+...
    qf_load('GM Superior parietal lobule 7M L.nii.gz')+...
    qf_load('GM Superior parietal lobule 7M R.nii.gz')+...
    qf_load('GM Superior parietal lobule 7P L.nii.gz')+...
    qf_load('GM Superior parietal lobule 7P R.nii.gz')+...
    qf_load('GM Superior parietal lobule 7PC L.nii.gz')+...
    qf_load('GM Superior parietal lobule 7PC R.nii.gz');
ROIname6digit='Prt_7_';
d_createROI_individual(im,ROIname6digit)



im= qf_load('GM Visual cortex V1 BA17 L.nii.gz')+...
    qf_load('GM Visual cortex V1 BA17 R.nii.gz')+...
    qf_load('GM Visual cortex V2 BA18 L.nii.gz')+...
    qf_load('GM Visual cortex V2 BA18 R.nii.gz')+...
    qf_load('GM Visual cortex V3V L.nii.gz')+...
    qf_load('GM Visual cortex V3V R.nii.gz')+...
    qf_load('GM Visual cortex V4 R.nii.gz')+...
    qf_load('GM Visual cortex V4 L.nii.gz')+...
    qf_load('GM Visual cortex V5 R.nii.gz')+...
    qf_load('GM Visual cortex V5 L.nii.gz');
ROIname6digit='vis___';
d_createROI_individual(im,ROIname6digit)



im=qf_load('Juxtapositional Lobule Cortex (formerly Supplementary Motor Cortex).nii.gz');
ROIname6digit='SMA___';
d_createROI_individual(im,ROIname6digit)


%cerebellu 

im= qf_load('Right VIIIa.nii.gz')+...
    qf_load('Left VIIIa.nii.gz');

ROIname6digit='Cer_8a';
d_createROI_individual(im,ROIname6digit)

im=qf_load('Right VIIIb.nii.gz')+qf_load('Left VIIIb.nii.gz');
ROIname6digit='Cer_8b';
d_createROI_individual(im,ROIname6digit)

im=qf_load('Left VI.nii.gz')+qf_load('Right VI.nii.gz');
ROIname6digit='Cer_6_';
d_createROI_individual(im,ROIname6digit)

im=qf_load('Left V.nii.gz')+qf_load('Right V.nii.gz');
ROIname6digit='Cer_5_';
d_createROI_individual(im,ROIname6digit)





















