function d_GCforHongkai

%cd /Users/fengqi/Documents/experiment/Causality
name{1}='ActiveL.xlsx';
name{2}='GloveL.xlsx';
name{3}='PassiveL.xlsx';
name{4}='SensoryL.xlsx';
name{5}='ActiveR.xlsx';
name{6}='GloveR.xlsx';
name{7}='PassiveR.xlsx';
name{8}='SensoryR.xlsx';
			
			
for kk=1:8
    figure
    hold on
    kk
    X=[]
   
    for ii=1:13
     
        
    [num,txt,raw]=xlsread(name{kk},ii);
    
    meannum=mean(num);stdnum=std(num);
    numn=num-ones(89,1)*meannum;
    
    X=cat(1,X,reshape(numn(:,1:8),1,89*8));
       
    end
   
    [F,pval,sig,morder]=d3_MVGC(X);
    save(strcat(name{kk},'.mat'));
end
