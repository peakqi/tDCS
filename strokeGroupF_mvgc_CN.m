function [FCN,pCN,sigCN]=strokeGroupF_mvgc_CN(GClist,kk,lrap)

load patientList_mac
load NodeList



%%%%%%%%%%%%%%%%%%%%control subject
sCn=10;
sG=size(GClist');
if lrap=='La'
    
        for ll=1:sG(1)
            sFile=strcat(patientList_mac{kk}.LaAdd,'/',NodeList(ll));
            fileID = fopen(sFile{1},'r');
            formatSpec='%f';
            X(ll,:)=fscanf(fileID,formatSpec,[1,Inf]);
            fclose(fileID);
        end
        [FCN,pCN,sigCN,morder{kk}]=MVGC(X);
        
    
elseif lrap=='Ra'
   
        for ll=1:sG(1)
            sFile=strcat(patientList_mac{kk}.RaAdd,'/',NodeList(ll));
            fileID = fopen(sFile{1},'r');
            formatSpec='%f';
            X(ll,:)=fscanf(fileID,formatSpec,[1,Inf]);
            fclose(fileID);
        end
       [FCN,pCN,sigCN,morder{kk}]=MVGC(X);
    
end