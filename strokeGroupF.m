function [FCN,FT2,FT3,pCN,pT2,pT3]=strokeGroupF(GClist,patientList_i)

load patientList

% % % % % % % % %1    '//share2/fatima/CN001/110902_CN001/reoriented_nii/Cn001_20110902_CIRC_Irvin_008_ep2d_bold_4_standard_SP_0.05.feat'
% % % % % % % % %2    '//share2/fatima/CN002/111007_CN002/reoriented_nii/Cn002_20111007_CIRC_Irvin_009_ep2d_bold_3_standard_SP_0.05.feat'
% % % % % % % % %3    '//share2/fatima/CN003/111028_CN003/reoriented_nii/CN003_20111028_CIRC_Irvin_005_ep2d_bold_1_standard_SP_0.05.feat'
% % % % % % % % %4     '//share2/fatima/CN004/111031_CN004/reoriented_nii/CN004_20111031_CIRC_Irvin_006_ep2d_bold_3_standard_SP_0.05.feat'
% % % % % % % % %5     '//share2/fatima/CN006/111129_CN006/reoriented_nii/CN006_20111129_CIRC_Irvin_006_ep2d_bold_3_standard_SP_0.05.feat'
% % % % % % % % %6     '//share2/fatima/CN007/111130_CN007/reoriented_nii/CN007_20111130_CIRC_Irvin_005_ep2d_bold_3_standard_SP_0.05.feat'
% % % % % % % % %7     '//share2/fatima/CN008/120402_CN008/reoriented_nii/CN008_20120402_CIRC_Irvin_004_ep2d_bold_1_standard_SP_0.05.feat'
% % % % % % % % %8     '//share2/fatima/CN009/120516_CN009/reoriented_nii/CN009_20120516_CIRC_Irvin_003_ep2d_bold_1_standard_SP_0.05.feat'
% % % % % % % % %9     '//share2/fatima/CN010/121123_CN010/reoriented_nii/CN010_20121123_2330_007_ep2d_bold_2_standard_SP_0.05.feat'
% % % % % % % % %10    '//share2/fatima/CN011/121130_CN011/reoriented_nii/CN011_20121130_2363_004_ep2d_bold_2_standard_SP_0.05.feat'
%11    '//share2/fatima/HiN001/110916_HiN001/reoriented_nii/Hin001_20110916_CIRC_Irvin_006_ep2d_bold_4_standard_SP_0.05.feat'
%12    '//share2/fatima/HiN005/111024_HiN005/reoriented_nii/Hin005_20111024_CIRC_Irvin_007_ep2d_bold_3_flipped_standard_SP_0.05.feat'
%13   s '//share2/fatima/HiN007/120104_HiN007/reoriented_nii/Hin007_20120104_CIRC_Irvin_005_ep2d_bold_3_standard_SP_0.05.feat'
%14   s '//share2/fatima/HiN009/120106_HiN009/reoriented_nii/Hin009_20120106_CIRC_Irvin_005_ep2d_bold_1_flipped_standard_SP_0.05.feat'
%15   s '//share2/fatima/HiN011/120217_HiN011/reoriented_nii/HIN011_20120217_CIRC_Irvin_006_ep2d_bold_3_standard_SP_0.05.feat'
%16    '//share2/fatima/HiN015/120307_HiN015/reoriented_nii/HIN015_20120307_CIRC_Irvin_007_ep2d_bold_3_flipped_standard_SP_0.05.feat'
%17    '//share2/fatima/HiN027/120828_HiN027/reoriented_nii/HIN027_20120828_CIRC_Irvin_005_ep2d_bold_2_flipped_standard_SP_0.05.feat'
%18    '//share2/fatima/HiN029/121017_HiN029/reoriented_nii/HIN029_20121017_CIRC_Irvin_008_ep2d_bold_2_flipped_standard_SP_0.05.feat'
%19   s '//share2/fatima/HiN032/121127_HiN032/reoriented_nii/HIN032_20121127_2340_008_ep2d_bold_1_standard_SP_0.05.feat'
%20    '//share2/fatima/HiN035/130222_HiN035/reoriented_nii/HiN035_20130222_2612_007_ep2d_bold_3_standard_SP_0.05.feat'
%21    '//share2/fatima/LoN006/111024_LoN006/reoriented_nii/Lon006_20111024_CIRC_Irvin_008_ep2d_bold_2_standard_SP_0.05.feat'
%22    '//share2/fatima/LoN010/120203_LoN010/reoriented_nii/LON010_20120203_CIRC_Irvin_009_ep2d_bold_4_standard_SP_0.05.feat'
%23   s '//share2/fatima/LoN018/120330_LoN018/reoriented_nii/LON018_20120330_CIRC_Irvin_005_ep2d_bold_1_standard_SP_0.05.feat'
%24   s '//share2/fatima/LoN019/120403_LoN019/reoriented_nii/LON019_20120403_CIRC_Irvin_006_ep2d_bold_3_standard_SP_0.05.feat'
%25   s '//share2/fatima/LoN021/120424_LoN021/reoriented_nii/LON021_20120424_CIRC_Irvin_003_ep2d_bold_1_flipped_standard_SP_0.05.feat'
%26    '//share2/fatima/LoN025/120717_LoN025/reoriented_nii/LON025_20120717_CIRC_Irvin_007_ep2d_bold_2_flipped_standard_SP_0.05.feat'
%100    /share2/fatima/HiN001/111014_HiN001/reoriented_nii/Pat_TP3_La-SP-0.005cluster.gfeat/cope1.feat
iii=0;
for patienti=11:26
    aa=size(find(patientList_i-patienti));
    bb=size(find(patientList_i));
    if aa(2)-bb(2)==-1
       iii=iii+1;
       [F_T2{patienti},F_T3{patienti},pval_T2{patienti},pval_T3{patienti}]= ...
           GCCAnalysis(patientList{patienti},GClist);
       if iii==1
           FT2=F_T2{patienti};FT3=F_T3{patienti};
           pT2=pval_T2{patienti};pT3=pval_T3{patienti};
       else
           FT2=F_T2{patienti}+FT2;FT3=F_T3{patienti}+FT3;
           pT2=pval_T2{patienti}+pT2;pT3=pval_T3{patienti}+pT3;
       end
    end
end
FT2=FT2/iii;
FT3=FT3/iii;
pT2=pT2/iii;
pT3=pT3/iii;


load CnList
load FileName

sCn=size(CnList);
sG=size(GClist');

for kk=1:sCn(1)
    for ll=1:sG(1)
        sFile=strcat(CnList{kk},'/',FileName(ll));
        fileID = fopen(sFile{1},'r');
        formatSpec='%f';
        X(ll,:)=fscanf(fileID,formatSpec,[1,Inf]);
        fclose(fileID);
    end
    [F{kk},pval{kk},sig{kk},morder{kk}]=GCCA(X);
end

for ii=1:sG
    for jj=1:sG
                   
        for kk=1:sCn 
            F_CN{ii,jj}(kk)=F{kk}(ii,jj);
            p_CN{ii,jj}(kk)=pval{kk}(ii,jj);
        end
        F_CN_mean{ii,jj}(1)=mean(F_CN{ii,jj}(:));
        F_CN_std{ii,jj}(1)=std(F_CN{ii,jj}(:));
        p_CN_mean{ii,jj}(1)=mean(p_CN{ii,jj}(:));
        p_CN_std{ii,jj}(1)=std(p_CN{ii,jj}(:));
    end
end

FCN=cell2mat(F_CN_mean);
pCN=cell2mat(p_CN_mean);
