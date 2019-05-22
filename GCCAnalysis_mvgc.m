function [F_T2,F_T3,pval_T2,pval_T3,sig_T2,sig_T3]= GCCAnalysis_mvgc(patient,GClist,lrap)
load NodeList

sCn=10;
sG=size(GClist');

if lrap=='La'
    for kk=1:sG(1)
        sFile=strcat(patient.T2Addr,'/',NodeList(GClist(kk)));
        
        fileID = fopen(sFile{1},'r');
        formatSpec='%f';
        X(kk,:)=fscanf(fileID,formatSpec,[1,Inf]);
        fclose(fileID);          
    end
    [F_T2,pval_T2,sig_T2,morder]=MVGC(X); 


    for kk=1:sG(1)
        sFile=strcat(patient.T3Addr,'/',NodeList(GClist(kk)));
        fileID = fopen(sFile{1},'r');
        formatSpec='%f';
        X(kk,:)=fscanf(fileID,formatSpec,[1,Inf]);
        fclose(fileID);          
    end
    [F_T3,pval_T3,sig_T3,morder]=MVGC(X); 

elseif lrap=='Ra'
    
    for kk=1:sG(1)
        sFile=strcat(patient.T2Ra,'/',NodeList(GClist(kk)));
        fileID = fopen(sFile{1},'r');
        formatSpec='%f';
        X(kk,:)=fscanf(fileID,formatSpec,[1,Inf]);
        fclose(fileID);          
    end
    [F_T2,pval_T2,sig_T2,morder]=MVGC(X); 


    for kk=1:sG(1)
        sFile=strcat(patient.T3Ra,'/',NodeList(GClist(kk)));
        fileID = fopen(sFile{1},'r');
        formatSpec='%f';
        X(kk,:)=fscanf(fileID,formatSpec,[1,Inf]);
        fclose(fileID);          
    end
    [F_T3,pval_T3,sig_T3,morder]=MVGC(X);
end

; 

