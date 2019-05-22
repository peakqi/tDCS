function L2_GCCA_combinedTS
load DirList
load FileName

sd=size(DirList);
sf=size(FileName);

limintvalue=0.2;
barscale=0.5;


for kk=1:sd(1)
    for ll=1:sf(1)
        sFile=strcat(DirList{kk},'/',FileName(ll));
        fileID = fopen(sFile{1},'r');
        formatSpec='%f';
        X(ll,:)=fscanf(fileID,formatSpec,[1,Inf]);
        fclose(fileID);
    end
    [F{kk},pval{kk},sig{kk},morder{kk}]=GCCA(X);
    
end

for ii=1:sf
    for jj=1:sf
        
 %1-10  CN pre             
        for kk=1:10 
            F_CN_Pre{ii,jj}(kk)=F{kk}(ii,jj);
        end
        F_CN_Pre_mean{ii,jj}(1)=mean(F_CN_Pre{ii,jj}(:));
        F_CN_Pre_std{ii,jj}(1)=std(F_CN_Pre{ii,jj}(:));
        
  %11-27  Patient pre   
  
        for kk=1:17
            F_patient_Pre{ii,jj}(kk) =F{kk+10}(ii,jj);
        end
        F_Patient_Pre_mean{ii,jj}(1)=mean(F_patient_Pre{ii,jj}(:));
        F_Patient_Pre_std{ii,jj}(1)=std(F_patient_Pre{ii,jj}(:));
        
        
 %28-37  CN pre             
        for kk=1:10 
            F_CN_Post{ii,jj}(kk)=F{kk+27}(ii,jj);
        end
        F_CN_Post_mean{ii,jj}(1)=mean(F_CN_Post{ii,jj}(:));
        F_CN_Post_std{ii,jj}(1)=std(F_CN_Post{ii,jj}(:));
        
  %38-54  Patient pre   
  
        for kk=1:17
            F_patient_Post{ii,jj}(kk) =F{kk+37}(ii,jj);
        end
        F_Patient_Post_mean{ii,jj}(1)=mean(F_patient_Post{ii,jj}(:));
        F_Patient_Post_std{ii,jj}(1)=std(F_patient_Post{ii,jj}(:));
            
      
        Patient_Post_Pre_mean{ii,jj}(1)= F_Patient_Post_mean{ii,jj}(1)- F_Patient_Pre_mean{ii,jj}(1);
        CN_Post_Pre_mean{ii,jj}(1)= F_CN_Post_mean{ii,jj}(1)- F_CN_Pre_mean{ii,jj}(1);
        
    end
end
close all


pcolor(cell2mat(F_CN_Pre_mean));
xlabel('from')
ylabel('to')
colorbar


figure
pcolor(cell2mat(F_CN_Post_mean));
xlabel('from')
ylabel('to')
colorbar


figure
pcolor(cell2mat(CN_Post_Pre_mean))
xlabel('from')
ylabel('to')
colorbar


%Patient Enhancement
figure
pcolor(cell2mat(F_Patient_Pre_mean))
xlabel('from')
ylabel('to')
colorbar



figure
pcolor(cell2mat(F_Patient_Post_mean))
xlabel('from')
ylabel('to')
colorbar



figure
pcolor(cell2mat(Patient_Post_Pre_mean))
xlabel('from')
ylabel('to')
colorbar


%  CN-Patient
figure
pcolor(cell2mat(F_CN_Pre_mean)-cell2mat(F_Patient_Pre_mean))
xlabel('from')
ylabel('to')
colorbar



figure
pcolor(cell2mat(F_CN_Post_mean)-cell2mat(F_Patient_Post_mean))
xlabel('from')
ylabel('to')
colorbar
hold on 




figure
pcolor(cell2mat(CN_Post_Pre_mean)-cell2mat(Patient_Post_Pre_mean))
xlabel('from')
ylabel('to')
colorbar




