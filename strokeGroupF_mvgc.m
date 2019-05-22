function [FCN,FT2,FT3,pCN,pT2,pT3,sigCN,sigT2,sigT3]=strokeGroupF_mvgc(GClist,patientList_i,lrap)

load patientList_mac
load NodeList


%%%%%%%%%%%%%%%patient
iii=0;
for patienti=11:26
    aa=size(find(patientList_i-patienti));
    bb=size(find(patientList_i));
    if aa(2)-bb(2)==-1
       iii=iii+1;
       
       [F_T2{patienti},F_T3{patienti},pval_T2{patienti},pval_T3{patienti},sig_T2{patienti},sig_T3{patienti}]= ...
           GCCAnalysis_mvgc(patientList_mac{patienti},GClist,lrap);
       if iii==1
           FT2=F_T2{patienti};FT3=F_T3{patienti};
           pT2=pval_T2{patienti};pT3=pval_T3{patienti};
           sigT2=sig_T2{patienti};sigT3=sig_T3{patienti};
       else
           FT2=F_T2{patienti}+FT2;FT3=F_T3{patienti}+FT3;
           pT2=pval_T2{patienti}+pT2;pT3=pval_T3{patienti}+pT3;
           sigT2=sig_T2{patienti}+sigT2;sigT3=sig_T3{patienti}+sigT3;
       end
    end
end
FT2=FT2/iii;
FT3=FT3/iii;
pT2=pT2/iii;
pT3=pT3/iii;
sigT2=sigT2/iii;
sigT3=sigT3/iii;


%%%%%%%%%%%%%%%%%%%%control subject
sCn=10;
sG=size(GClist');
if lrap=='La'
    for kk=1:sCn(1)
        for ll=1:sG(1)
            sFile=strcat(patientList_mac{kk}.LaAdd,'/',NodeList(ll));
            fileID = fopen(sFile{1},'r');
            formatSpec='%f';
            X(ll,:)=fscanf(fileID,formatSpec,[1,Inf]);
            fclose(fileID);
        end
        [F{kk},pval{kk},sig{kk},morder{kk}]=MVGC(X);
        F{kk}=F{kk}.*sig{kk};
    end
elseif lrap=='Ra'
    for kk=1:sCn(1)
        for ll=1:sG(1)
            sFile=strcat(patientList_mac{kk}.RaAdd,'/',NodeList(ll));
            fileID = fopen(sFile{1},'r');
            formatSpec='%f';
            X(ll,:)=fscanf(fileID,formatSpec,[1,Inf]);
            fclose(fileID);
        end
        [F{kk},pval{kk},sig{kk},morder{kk}]=MVGC(X);
         F{kk}=F{kk}.*sig{kk};
    end
end

for ii=1:sG
    for jj=1:sG
                   
        for kk=1:sCn 
            F_CN{ii,jj}(kk)=F{kk}(ii,jj);
            p_CN{ii,jj}(kk)=pval{kk}(ii,jj);
            sig_CN{ii,jj}(kk)=sig{kk}(ii,jj);
        end
        F_CN_mean{ii,jj}(1)=mean(F_CN{ii,jj}(:));
        p_CN_mean{ii,jj}(1)=mean(p_CN{ii,jj}(:));
        sig_CN_mean{ii,jj}(1)=mean(sig_CN{ii,jj}(:));
    end
end

FCN=cell2mat(F_CN_mean);
pCN=cell2mat(p_CN_mean);
sigCN=cell2mat(sig_CN_mean);