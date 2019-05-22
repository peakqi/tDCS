function d_createROI_individual(maskfile,ROIname6digit)



whole=ones(182,218,182);
L=whole;R=whole;
L(92:182,:,:)=0;
R(1:91,:,:)=0;

if strcmp(class(maskfile),'char')
    
    im=qf_load(maskfile);
else
    im=maskfile;
end
    
    
im=im/max(max(max(im)));
qf_save(im.*R,strcat(ROIname6digit,'_R.nii.gz'))
SliceBrowser(im.*R)
title(strcat(ROIname6digit,'_R.nii.gz'))

if sum(sum(sum(im.*L)))==0
    im=flip(im,1);
end 
qf_save(im.*L,strcat(ROIname6digit,'_L.nii.gz'))
SliceBrowser(im.*single(L))
title(strcat(ROIname6digit,'_L.nii.gz'))
