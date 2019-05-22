function a_process_all_subj
cd /Users/fengqi/Documents/experiment/Data
lslist=ls;
ilist = strsplit(lslist,'\n');
len=length(ilist);




for ii=2:len-1
    ii
    if length(strfind(ilist{ii},'_bin')>0) |length(strfind(ilist{ii},'_RGB')>0)|length(strfind(ilist{ii},'mask')>0)
    else
        nii=load_nii(ilist{ii});
        ni=nii.img;
        ni=single(ni>=2);
        nii=make_nii(ni);
        save_nii(nii,strcat('_bin20_',ilist{ii}));
    end
end

