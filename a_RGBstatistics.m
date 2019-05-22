function a_RGBstatistics

%'mask_rightcere.nii.gz','mask_leftcere.nii.gz','mask_rightmotor.nii.gz','mask_leftmotor.nii.gz'

nii=load_nii('mask_rightmotor.nii.gz');
MASK=nii.img;

cd /Users/fengqi/Documents/experiment

lr='la'

shamtdcs='tdcs'
tp='TP2'

if strcmp(tp,'TP1')& strcmp(shamtdcs,'sham')
    iflag=5;
else
    iflag=15;
end

if strcmp(shamtdcs,'sham')
    itotal=7;
else
    itotal=9;
end

%sham TP1 missed ii=5 brain
for ii=1:itotal
    ii
    if ii==iflag
    else
        nii=load_nii(strcat('_bin20_cn_',lr,'.nii.gz'));
        R=nii.img;
        nii=load_nii(strcat('_bin20_',shamtdcs,'_00',num2str(ii),'_',lr,'_',tp,'_zstat1.nii.gz'));
        G=nii.img;
        nii=load_nii(strcat('_bin20_',shamtdcs,'_00',num2str(ii),'_',lr,'_TP3_zstat1.nii.gz'));  
        B=nii.img;
        RGBstatics =a_calculate_voxels(single(R),single(G),single(B),MASK);
        rgb=cat(4,single(R).*MASK,single(G).*MASK,single(B).*MASK);

        if ii==1
            table=RGBstatics;
        else
            table=cat(1,table,RGBstatics);
        end
    end
end


table=table';
a=1

cd /Users/fengqi/Documents/experiment/
%cd /Users/fengqi/Documents/experiment/Data/_
% nii=load_nii('Juelich-maxprob-thr0-1mm.nii.gz');
% mask=nii.img;
% %47 49 91
% mask_rightmotor=single(mask==47 |mask==49 | mask==91);
% mask_leftmotor=single(mask==48 |mask==50|mask==92);
% nii=make_nii(mask_rightmotor);
% save_nii(nii,'mask_rightmotor.nii.gz');
% nii=make_nii(mask_leftmotor);
% save_nii(nii,'mask_leftmotor.nii.gz');
% 
% 
% 
% nii=load_nii('MNI-maxprob-thr0-1mm.nii.gz');
% mask=nii.img;
% mask_cerebellum=single(mask==2);
% mask_half=mask(1:91,:,:)*0;
% mask_left=cat(1,mask_half,mask_half+1);
% mask_leftcere=single(mask_left).*mask_cerebellum;
% mask_right=cat(1,mask_half+1,mask_half);
% mask_rightcere=single(mask_right).*mask_cerebellum;
% nii=make_nii(mask_rightcere);
% save_nii(nii,'mask_rightcere.nii.gz');
% nii=make_nii(mask_leftcere);
% save_nii(nii,'mask_leftcere.nii.gz');


