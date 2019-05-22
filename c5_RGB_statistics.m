function  RGBstatics=c5_RGB_statistics(RealSham,TP,lrap,maskname,p2123)

switch nargin
    case 5
      
    otherwise
        RealSham='R';
        TP='TP2'
        lrap='La'
        maskname='mask_rightmotor.nii.gz'
       
        
end
if strfind(maskname,'rightmotor')>0
        mask2='Pre____R.nii.gz';
        mask3='Pri____R.nii.gz';
        mask4='SMA____R.nii.gz';
        mask=qf_load(mask4)+qf_load(mask2)+qf_load(mask3);%
elseif strfind(maskname,'left_motor')>0    
        mask2='Pre____L.nii.gz';
        mask3='Pri____L.nii.gz';
        mask4='SMA____L.nii.gz';
        mask=qf_load(mask4)+qf_load(mask2)+qf_load(mask3);%
elseif strfind(maskname,'rightcereb')>0
       mask=qf_load('mask_rightcereb.nii.gz');
    
elseif strfind(maskname,'left_cereb')>0
    
       mask=qf_load('mask_left_cereb.nii.gz');
else
      disp('wrong');
    
end
    
    
    

mask=single(mask>0);
if strcmp(RealSham,'R')
    N=9;
else
    N=7;
end



for ii=1:N
    im=qf_load(strcat('RGB_thr',num2str(p2123),'_',RealSham,num2str(ii),'_',TP,'_',lrap,'.nii.gz'));
    R=im(:,:,:,1);
    G=im(:,:,:,2);
    B=im(:,:,:,3);
    if ii==1
        RGBstatics =c4_calculate_voxels(im(:,:,:,1),im(:,:,:,2),im(:,:,:,3),mask);
    else
        rgb =c4_calculate_voxels(im(:,:,:,1),im(:,:,:,2),im(:,:,:,3),mask);
        RGBstatics=cat(1,RGBstatics,rgb);
    end
end
save(strcat('RGB_thr',num2str(p2123),'_',RealSham,'_',TP,'_',lrap,'_',maskname,'.mat'),'RGBstatics')



    
% mask{1}='rightmotor';
% mask{2}='left_motor';
% mask{3}='rightcereb';
% mask{4}='left_cereb';
% for ii=1:4
% 
% c5_RGB_statistics('R','TP1','La',mask{ii},196)
% c5_RGB_statistics('R','TP1','Ra',mask{ii},196)
% c5_RGB_statistics('R','TP1','Lp',mask{ii},196)
% c5_RGB_statistics('R','TP1','Rp',mask{ii},196)
% c5_RGB_statistics('S','TP2','La',mask{ii},196)
% c5_RGB_statistics('S','TP2','Ra',mask{ii},196)
% c5_RGB_statistics('S','TP2','Lp',mask{ii},196)
% c5_RGB_statistics('S','TP2','Rp',mask{ii},196)
% c5_RGB_statistics('R','TP2','La',mask{ii},196)
% c5_RGB_statistics('R','TP2','Ra',mask{ii},196)
% c5_RGB_statistics('R','TP2','Lp',mask{ii},196)
% c5_RGB_statistics('R','TP2','Rp',mask{ii},196)
% c5_RGB_statistics('S','TP1','La',mask{ii},196)
% c5_RGB_statistics('S','TP1','Ra',mask{ii},196)
% c5_RGB_statistics('S','TP1','Lp',mask{ii},196)
% c5_RGB_statistics('S','TP1','Rp',mask{ii},196)
% end

