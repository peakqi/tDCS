function d2_extract_timeseries_submask_10subgroup

load patient-mask.mat;
cd /Users/fengqi/Documents/experiment/Data/ts
load submask


format short
lr={'La','Ra','Lp','Rp'};
for kk=2:4 
    for ii=72:76
        ii
        if isempty(dataID{ii})|(timepoint(ii)==1)
        else      
     
           
            im=qf_load(strcat(LaRaLpRp_addr{ii,kk},'/filtered_func_data.nii.gz'));     
            for jj=1:42
               ts=[];
                    ii,jj,kk
                    subgroup=10;
                    pp=0;
               for qq=1:subgroup  
                   sm=submask{jj,qq}.*mask{jj};
                   for oo=1:89
                       
                       imp=im(:,:,:,oo).*sm;
                       pp=pp+1;
                        ts(pp)=sum(sum(sum(imp)))/w_mask(jj)/subgroup;
                   end
               end  
                   save (strcat(dataID{ii}, '_',lr{kk},'_TP',...
                      num2str(timepoint(ii)),'_',masklist{jj}(1:8),'.mat'),'ts')
                 disp( strcat(dataID{ii}, '_',lr{kk},'_TP',...
                      num2str(timepoint(ii)),'_',masklist{jj}(1:8),'.mat'))
               
            end
            
        end

    end   
end
