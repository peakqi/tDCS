function a_calculate_average

cd /Users/fengqi/Documents/experiment/Data
lslist=ls;
ilist = strsplit(lslist,'\n');
len=length(ilist);



counter=0

for ii=2:len-1
    ii
    if length(strfind(ilist{ii},'_bin')>0) | length(strfind(ilist{ii},'_ave')>0)
    else
        if length(strfind(ilist{ii},'cn')>0)& ...
                length(strfind(ilist{ii},'ra')>0) %&...
%                 length(strfind(ilist{ii},'TP3')>0)
            nii=load_nii(ilist{ii});
            ni=nii.img;
            if counter==0
                sum=ni;
                counter=counter+1;
            else
                sum=sum+ni;
                counter=counter+1;
            end
            
        else
        end
            
    
    end
  
    
end

    counter
    niii=make_nii(sum/counter);
    save_nii(niii,'_ave_cn_ra.nii.gz');