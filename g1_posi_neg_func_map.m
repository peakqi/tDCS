function g1_posi_neg_func_map

load patient-mask.mat;


cd /Users/fengqi/Documents/experiment/Data/posi_neg_func
format short
lr={'La','Ra','Lp','Rp'};
s1=15;s2=18;
activ=[s1:s2 s1+14:s2+14 s1+14*2:s2+14*2 s1+14*3:s2+14*3 s1+14*4:s2+14*4]
s1=23;s2=26;
rest=[s1:s2 s1+14:s2+14 s1+14*2:s2+14*2 s1+14*3:s2+14*3 s1+14*4:s2+14*4]

for ii=75:76
    ii
    if isempty(dataID{ii})|(timepoint(ii)==1)
    else      
     
        for kk=1:4     
            im=qf_load(strcat(LaRaLpRp_addr{ii,kk},'/filtered_func_data.nii.gz'));  
            
            ac=sum(im(:,:,:,activ),4)/20;
            re=sum(im(:,:,:,rest),4)/20;
            qf_save(ac,strcat('ac_PosiNegFunc_',dataID{ii},'_',lr{kk},'_TP',num2str(timepoint(ii)),'.nii.gz'))
            qf_save(re,strcat('re_PosiNegFunc_',dataID{ii},'_',lr{kk},'_TP',num2str(timepoint(ii)),'.nii.gz'))
                         

            
        end

    end   
end

% a=ls;
% b=strsplit(a);
% 
% for ii=1:7101
%     ii
%     for jj=1:73
%          if  strcmp(b{ii}(1:6),patientID{jj})
%              movefile(b{ii},strcat(dataID{jj},b{ii}(7:end)));
%              strcat(dataID{jj},b{ii}(7:end))
%              break;
%          end
%          
%     end
%     
% end
% % setenv('FSLDIR','/usr/local/fsl');
% setenv('FSLOUTPUTTYPE', 'NIFTI_GZ');

% cmd = '/usr/local/fsl/bin/feat design.fsf';
% system(cmd);
 % cmd='/usr/local/fsl/bin/fslview'
% system (cmd)
% for ii=1:42
%     ii
%     w_mask(ii)=sum(sum(sum(mask{ii})));
%     
% end 
% 
% load patientinfo
% cd /Users/fengqi/Documents/experiment/Data/mask
% 
% % aa=ls;
% % aaa=strsplit(aa);
% for ii=41:42
%     ii
%     mask{ii}=qf_load(masklist{ii});
%     
% end
% 
% for ii=1:23
% LRAP_flipped{ii,1}=LRAP{ii,1};
% LRAP_flipped{ii,2}=LRAP{ii,2};
% LRAP_flipped{ii,3}=LRAP{ii,3};
% LRAP_flipped{ii,4}=LRAP{ii,4};
% end
% for ii=24:71
%     for kk=1:4
%      if strcmp(lesionside{ii},'RS')
%          
%             if strcmp(LRAP{ii,kk}(1),'R')
%                LRAP_flipped{ii,kk} = strcat('L',LRAP{ii,kk}(2));
%             else
%                 LRAP_flipped{ii,kk} = strcat('R',LRAP{ii,kk}(2))
%             end
%          
%      else
%         
%          LRAP_flipped{ii,kk}=LRAP{ii,kk};
%         
%      end
%     end
% end