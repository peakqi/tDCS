function g0_avefuncmap

Im=[];
for ii=1:9
   
    im=qf_load(strcat('R',num2str(ii),'TP1_La.nii.gz'));
    if ii==1
        Im=im;
    else
        Im=Im+im;
    end
        
end
IM=Im/9;
qf_save(IM,'avefunc_tDCS.nii.gz')