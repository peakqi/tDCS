function g3_generate_pnFuncMaps_patitentavg(lrap1,tp)


load patient-mask.mat;
mask=qf_load('FSLmask.nii.gz');
% CRS='C'
% lrap1='Lp'
% tp='TP2'

    n1=1;
    nn=9;
    ntotal=9;
for ii=n1:nn
   namestrre=strcat('re_PosiNegFunc_','R',num2str(ii),'_',lrap1,'_',tp,'.nii.gz');
   namestrac=strcat('ac_PosiNegFunc_','R',num2str(ii),'_',lrap1,'_',tp,'.nii.gz');
    if ii==n1
        imre=qf_load(namestrre);
        imac=qf_load(namestrac);
        ratio=reshape((imac-imre)./imre,1,182*218*182);
        tot=ratio;
    else
        imre=qf_load(namestrre);
        imac=qf_load(namestrac);
        ratio=cat(1,ratio,reshape((imac-imre)./imre,1,182*218*182));
        tot=tot+reshape((imac-imre)./imre,1,182*218*182);
    end 
    %qf_save((imac-imre)./imre,strcat('R',num2str(ii),'_',lrap1,'_',tp,'.nii.gz'))
end

for ii=n1:nn
    if ii==8|ii==9
    else
   namestrre=strcat('re_PosiNegFunc_','S',num2str(ii),'_',lrap1,'_',tp,'.nii.gz');
   namestrac=strcat('ac_PosiNegFunc_','S',num2str(ii),'_',lrap1,'_',tp,'.nii.gz');
   
        imre=qf_load(namestrre);
        imac=qf_load(namestrac);
        
        ratio=cat(1,ratio,reshape((imac-imre)./imre,1,182*218*182));
        tot=tot+reshape((imac-imre)./imre,1,182*218*182);
    end
    %qf_save((imac-imre)./imre,strcat('S',num2str(ii),'_',lrap1,'_',tp,'.nii.gz'))
end


[h p]= ttest(ratio,0,'Alpha',0.01);
hmap=reshape(h,182,218,182);
pmap=reshape(p,182,218,182);
totmap=reshape(tot,182,218,182);
% qf_save(totmap/ntotal,strcat('tot_PosiNegFunc_',CRS,'_',lrap1,'_',tp,'.nii.gz'))
qf_save(mask.*single((1-pmap)>0.95).*single(totmap/16>0).*totmap/ntotal,strcat('_pPosi_PosiNegFunc_patient_avg_',lrap1,'_',tp,'.nii.gz'))
qf_save(mask.*single((1-pmap)>0.95).*single(totmap/16<0).*totmap/ntotal*-1,strcat('_pNeg_PosiNegFunc_patient_avg_',lrap1,'_',tp,'.nii.gz'))
% qf_save(mask.*single((1-pmap)>0.95).*single(totmap/ntotal<0).*totmap/ntotal*-1+mask.*single((1-pmap)>0.95).*single(totmap/ntotal>0).*totmap/ntotal,strcat('p2Func_',CRS,'_',lrap1,'_',tp,'.nii.gz'))
% 
% qf_save(mask.*single((1-pmap)>0.95).*totmap/9,strcat('pFunc_',CRS,'_',lrap1,'_',tp,'.nii.gz'))



CRS,lrap1,tp
% 

% g2_generate_pnFuncMaps('C','La','TP2')
% g2_generate_pnFuncMaps('C','Lp','TP2')
% g2_generate_pnFuncMaps('C','Ra','TP2')
% g2_generate_pnFuncMaps('C','Rp','TP2')
% 
% g2_generate_pnFuncMaps('R','La','TP2')
% g2_generate_pnFuncMaps('R','La','TP3')
% g2_generate_pnFuncMaps('R','Lp','TP2')
% g2_generate_pnFuncMaps('R','Lp','TP3')
% g2_generate_pnFuncMaps('R','Ra','TP2')
% g2_generate_pnFuncMaps('R','Ra','TP3')
% g2_generate_pnFuncMaps('R','Rp','TP2')
% g2_generate_pnFuncMaps('R','Rp','TP3')
% 
% g2_generate_pnFuncMaps('S','La','TP2')
% g2_generate_pnFuncMaps('S','La','TP3')
% g2_generate_pnFuncMaps('S','Lp','TP2')
% g2_generate_pnFuncMaps('S','Lp','TP3')
% g2_generate_pnFuncMaps('S','Ra','TP2')
% g2_generate_pnFuncMaps('S','Ra','TP3')
% g2_generate_pnFuncMaps('S','Rp','TP2')
% g2_generate_pnFuncMaps('S','Rp','TP3')