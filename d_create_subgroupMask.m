function d_create_subgroupMask
subgroup=10;

cd /Users/fengqi/Documents/experiment/Data/ts
 maline0=reshape(mask{1},182*218*182,1)*0;
 maline1=reshape(mask{1},182*218*182,1)*0+1;
for ii=1:42
    
    ma=mask{ii};
    
    ma_r=reshape(ma,182*218*182,1);
    ind=find(ma);
    sz1=size(ind);
    for jj=1:subgroup
        
        maskline=maline0;
        maskline(ind(jj:subgroup:sz1))=1;
       sub1= reshape(maskline,182,218,182);
       submask{ii,jj}=sub1;
       
    end
    
    sum(sum(sum(sub1)))

   
end
    save submask -v7.3