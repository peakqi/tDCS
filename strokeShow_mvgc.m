function para= strokeShow_mvgc %(maski,lrap,patientiList)

image_flag=1;
MVGC_flag=1; 
T4_Pred_flag=1;
statistics_flag=1;

patient_all=11:26;
patient_sham=[13,14,15,19,23,24,25];
patient_tdcs=[11,12,16,17,18,20,21,22,26];
patientiList=[13,14,15,19,23,24,25];
lrap='La'; %La Ra Lp Rp
maski=[8,10,14];


load patientList_mac % control and patient la ra address
load NodeList    % node name list
load maskList_mac    % mask adress  with or without intersection with RUGUB

GClist=[3,4,15,16,1,2,21,22,11,12,17,18,5,6,23,24,19,20,7,8,13,14,9,10,];
GClist=[3,15,1,21,11,17,5,23,19,7,13,9,4,16,2,22,12,18,6,24,20,8,14,10];


%%%% MVGC calculation of connection strength for patientiList

if MVGC_flag==1     
    [FCN,FT2,FT3,pCN,pT2,pT3,sigCN,sigT2,sigT3]=strokeGroupF_mvgc(GClist,patientiList,lrap);
%     a=FCN.*(1-(sigCN==0));
%     b=FT2.*(1-(sigT2==0));
%     c=FT3.*(1-(sigT3==0));
%     a=FCN.*sigCN;
%     b=FT2.*sigT2;
%     c=FT3.*sigT3;
    a=FCN;
    b=FT2;
    c=FT3;
    d=b-a;
    e=c-b;
    f=a-c;

    
    if image_flag==1
        
         rr=0.0;
        for kk=1:length(NodeList)
            Node{kk}.name=NodeList{kk}(1:end-4);
        end
        Node{1}.x= 8+rr*(rand-0.5);
        Node{1}.y= 5+rr*(rand-0.5) ;

        Node{2}.x= 4 +rr*(rand-0.5);
        Node{2}.y= 5 +rr*(rand-0.5);

        Node{3}.x= 7+rr*(rand-0.5) ;
        Node{3}.y=  2+rr*(rand-0.5);

        Node{4}.x= 5+rr*(rand-0.5) ;
        Node{4}.y= 2 +rr*(rand-0.5);

        Node{5}.x=  8+rr*(rand-0.5);
        Node{5}.y=  8+rr*(rand-0.5);

        Node{6}.x= 4 +rr*(rand-0.5);
        Node{6}.y=  8+rr*(rand-0.5);

        Node{7}.x= 9 +rr*(rand-0.5);
        Node{7}.y= 7 +rr*(rand-0.5);

        Node{8}.x= 3 +rr*(rand-0.5);
        Node{8}.y= 7 +rr*(rand-0.5);

        Node{9}.x= 10 +rr*(rand-0.5);
        Node{9}.y= 6.5 +rr*(rand-0.5);

        Node{10}.x=  2+rr*(rand-0.5);
        Node{10}.y= 6.5 +rr*(rand-0.5);

        Node{11}.x= 10 +rr*(rand-0.5);
        Node{11}.y=  4+rr*(rand-0.5);

        Node{12}.x= 2 +rr*(rand-0.5);
        Node{12}.y= 4 +rr*(rand-0.5);

        Node{13}.x= 6.0 +rr*(rand-0.5);
        Node{13}.y=  7+rr*(rand-0.5);

        Node{14}.x= 6 +rr*(rand-0.5);
        Node{14}.y= 7 +rr*(rand-0.5);

        Node{15}.x= 6.5 +rr*(rand-0.5);
        Node{15}.y= 4.5 +rr*(rand-0.5);

        Node{16}.x= 5.5+rr*(rand-0.5) ;
        Node{16}.y=  4.5+rr*(rand-0.5);

        Node{17}.x= 9 +rr*(rand-0.5);
        Node{17}.y=  3+rr*(rand-0.5);

        Node{18}.x=  3+rr*(rand-0.5);
        Node{18}.y=  3+rr*(rand-0.5);

        Node{19}.x= 8.5 +rr*(rand-0.5);
        Node{19}.y= 9 +rr*(rand-0.5);

        Node{20}.x= 3.5+rr*(rand-0.5) ;
        Node{20}.y= 9+rr*(rand-0.5);

        Node{21}.x= 8 +rr*(rand-0.5);
        Node{21}.y=  1+rr*(rand-0.5);

        Node{22}.x=  4+rr*(rand-0.5);
        Node{22}.y=  1+rr*(rand-0.5);
        
        
        Node{23}.x= 6 +rr*(rand-0.5);
        Node{23}.y=  10+rr*(rand-0.5);

        Node{24}.x= 6 +rr*(rand-0.5);
        Node{24}.y=  10+rr*(rand-0.5);
        
        barscale=.5; cmax=0.03;cmin=-0.03;
%         display_GC(a,GClist,NodeList,barscale,cmin,cmax)
%         display_GC(b,GClist,NodeList,barscale,cmin,cmax) 
%         display_GC(c,GClist,NodeList,barscale,cmin,cmax)
%         display_GC(d,GClist,NodeList,barscale,cmin,cmax)
        display_GC(e,GClist,NodeList,barscale,cmin,cmax)
        colormap jet
      %  GC_connection_graph(e,Node,GClist);
        %display_GC(f,GClist,NodeList,barscale,cmin,cmax)
    end
end


iii=0;
if lrap=='Ra'
        Cs=load_nii('C_Ra.nii');
else
    Cs=load_nii('C.nii');
end


for ii=1:length(patientiList)
    iii=iii+1;
    if lrap=='La'
        
        T2s=load_nii(strcat(patientList_mac{patientiList(ii)}.T2Addr,'/thresh_zstat1.nii.gz'));
        T3s=load_nii(strcat(patientList_mac{patientiList(ii)}.T3Addr,'/thresh_zstat1.nii.gz')); 
    elseif lrap=='Ra'
        T2s=load_nii(strcat(patientList_mac{patientiList(ii)}.T2Ra,'/thresh_zstat1.nii.gz'));
        T3s=load_nii(strcat(patientList_mac{patientiList(ii)}.T3Ra,'/thresh_zstat1.nii.gz')); 
    end
    if iii==1
       T2s_img=T2s.img;
       T3s_img=T3s.img;
    else
        T2s_img=T2s_img+T2s.img;
        T3s_img=T3s_img+T3s.img; 
    end
    
end
T2s_img=T2s_img/iii;
T3s_img=T3s_img/iii;
Is=cat(4,Cs.img,T2s_img,T3s_img);
Is=im2double(Is);



scal=1;
M=max(max(max(max(Is(:,:,:,:)))));
m=min(min(min(min(Is(:,:,:,:)))));
M=5.6; m=0;
Is_norm(:,:,:,:)=scal*(Is(:,:,:,:)-m)/(M-m);
Is1(:,:,:,1:3)=im2bw(Is_norm(:,:,:,1:3),0.25);


maSize=size(maski);
mask=[];
for ll=1:maSize(2)
    masks=load_nii(maskList_mac{maski(ll)});
    if isempty(mask)==1
    mask=masks.img;
    else
        mask=mask+masks.img;
    end
end




if image_flag==1
    MNIs=load_nii('MNI.nii');
    Im=cat(4,MNIs.img,MNIs.img,MNIs.img);
    MNI=im2double(Im);    I_mni=MNI(:,:,:,1);

    I8=cat(4,I_mni,I_mni,I_mni)+cat(4,Is1(:,:,:,1),Is1(:,:,:,2),Is1(:,:,:,3));
    SliceBrowser(I8)
 
    I10=cat(4,Is(:,:,:,1),Is(:,:,:,2),Is(:,:,:,3));
    I11=cat(4,I_mni,I_mni,I_mni)+I10/M;
     SliceBrowser(I11)
     


 
     %I9=cat(4,I_mni,I_mni,I_mni)+cat(4,Is1(:,:,:,1),t2,t3);
      % SliceBrowser(I9)
    I8=cat(4,I_mni,I_mni,I_mni)*0+cat(4,Is1(:,:,:,1),Is1(:,:,:,1)*0,Is1(:,:,:,1)*0);
    II=I8(:,:,133,:);II3=reshape(II,182,218,3); figure;imshow(II3)
    I8=cat(4,I_mni,I_mni,I_mni)*0+cat(4,Is1(:,:,:,2)*0,Is1(:,:,:,2),Is1(:,:,:,2)*0);
    II=I8(:,:,133,:);II3=reshape(II,182,218,3); figure;imshow(II3)
    I8=cat(4,I_mni,I_mni,I_mni)*0+cat(4,Is1(:,:,:,3)*0,Is1(:,:,:,3)*0,Is1(:,:,:,3));
    II=I8(:,:,133,:);II3=reshape(II,182,218,3); figure;imshow(II3)
   
    
%     JJ=I_mni(:,108,:);
%     JJ3=reshape(JJ,182,182);    
 zslice=40
    I8=cat(4,I_mni,I_mni,I_mni)*0+cat(4,Is1(:,:,:,1),Is1(:,:,:,2),Is1(:,:,:,3));
    II=I8(:,:,zslice,:);II3=reshape(II,182,218,3);figure;imshow(II3)  
    
    if T4_Pred_flag==1;
        t2=Is1(:,:,:,2);
        t3=Is1(:,:,:,3);%T3s_img;
        dt=t3-t2;
        dtpos=max(dt,0);
        dtneg=max(-dt,0);
        SE = strel('ball', 6, 5); %R and Hight
        dtneg1=imdilate(dtneg,SE);
        dtneg1=(dtneg1-5)>0.1;
        t3=max(t3-dtneg1,0);

        dtpos1=imdilate(dtpos,SE);
        dtpos1=dtpos1-4.99>0.1;
        t3=t3+dtpos1;


        I8=cat(4,I_mni,I_mni,I_mni)*0+cat(4,Is1(:,:,:,1),Is1(:,:,:,2),t3);
        II=I8(:,:,zslice,:);II3=reshape(II,182,218,3);figure;imshow(II3) 
    end
%     J = histeq(JJ3);JJ_mni=J.*(1-Is123);
%     im_comb=cat(3,JJ_mni,JJ_mni,JJ_mni)+II3;
%     figure;imshow(im_comb)
end
%%%%%%%%%%%%

if statistics_flag==1
    if image_flag==1
        imgshow1(Is_norm,mask);
    end
para= imgstatistic1(Is1,mask);
patientiList
maski
paraDsrp.black=strcat(num2str(para.black),'--  ',num2str(para.black/para.total),'     No Func');
paraDsrp.red=strcat(num2str(para.red),'--  ',num2str(para.red/para.total),'     Permanent Lost Func');
paraDsrp.green=strcat(num2str(para.green),'--  ',num2str(para.green/para.total),'     Trasient Occuring Func');
paraDsrp.yellow=strcat(num2str(para.yellow),'--  ',num2str(para.yellow/para.total),'     Long-term Lost Func');
paraDsrp.blue=strcat(num2str(para.blue),'--  ',num2str(para.blue/para.total),'     Newly Trained Func');
paraDsrp.purple=strcat(num2str(para.purple),'--  ',num2str(para.purple/para.total),'     Recovered Func');
paraDsrp.lightblue=strcat(num2str(para.lightblue),'--  ',num2str(para.lightblue/para.total),'     Long-term Occuring func');
paraDsrp.white=strcat(num2str(para.white),'--  ',num2str(para.white/para.total),'     Uninfluenced Func');
paraDsrp.total=strcat(num2str(para.total),'--  ',num2str(para.total/para.total),'         Total');

paraDsrp

end

% patient_all=11:26;
% patient_sham=[13,14,15,19,23,24,25];
% patient_tdcs=[11,12,16,17,18,20,21,22,26];
% patientiList=patient_tdcs;%patient_sham;
% lrap='La'; %La Ra Lp Rp
% maski=[8,10,14]
% paraDsrp= strokeShow_mvgc (maski,lrap,patientiList)

%  1   'BG_L.txt'
%  2   'BG_R.txt'
%  3   'Cere_L.txt'
%    4 'Cere_R.txt'
%     5'Insula_L.txt'
%     6'Insula_R.txt'
%     7'Pre_L.txt'
%     8'Pre_R.txt'
%     9'Pri_L.txt'
%    10 'Pri_R.txt'
%     11'S1_L.txt'
%    12 'S1_R.txt'
%    13 'SMA_L.txt'
%    14 'SMA_R.txt'
%    15 'Thala_L.txt'
%    16 'Thala_R.txt'
%    17 'SPC_L.txt'
%    18 'SPC_R.txt'
%    19 'PFC_L.txt'
%    20 'PFC_R.txt'
%    21 'V1_L.txt'
%    22 'V2_R.txt'
%    23 'Cin_L.txt'
%    24 'Cin_R.txt'
%    25 'FFC_L.txt'
%    26 'FFC_R.txt'



% Ct=load_nii('C_thr3.nii');
% T2t=load_nii('T2_thr3.nii');
% T3t=load_nii('T3_thr3.nii');
% It=cat(4,Ct.img,T2t.img,T3t.img);
% It=im2double(It);

% T4  Predict by image dilation and erosion
% if needed==1
% t2=Is1(:,:,:,2);
% t3=Is1(:,:,:,3);%T3s_img;
% dt=t3-t2;
% dtpos=max(dt,0);
% dtneg=max(-dt,0);
% SE = strel('ball', 6, 5); %R and Hight
% dtneg1=imdilate(dtneg,SE);
% dtneg1=(dtneg1-5)>0.1;
% t3=max(t3-dtneg1,0);
% 
% dtpos1=imdilate(dtpos,SE);
% dtpos1=dtpos1-4.99>0.1;
% t3=t3+dtpos1;
% I9=cat(4,I_mni,I_mni,I_mni)+cat(4,Is1(:,:,:,1),t2,t3);
% % SliceBrowser(I9)
% end



% I8=cat(4,I_mni,I_mni,I_mni)*0+cat(4,Is1(:,:,:,1),Is1(:,:,:,2),Is1(:,:,:,3));
% II=I8(:,108,:,:);
% II3=reshape(II,182,182,3);
% Is123=min(1,II3(:,:,1)+II3(:,:,2)+II3(:,:,3));
% 
% JJ=I_mni(:,108,:);
% JJ3=reshape(JJ,182,182);
% J = histeq(JJ3);
% JJ_mni=J.*(1-Is123);
% 
% im_comb=cat(3,JJ_mni,JJ_mni,JJ_mni)+II3;
% figure;imshow(im_comb)
% I9=cat(4,I_mni,I_mni,I_mni)*0+cat(4,Is(:,:,:,1),Is(:,:,:,2),Is(:,:,:,3));
% 
% II9=I9(:,108,:,:);
% II4=reshape(II9,182,182,3);
% Is123=II4(:,:,1)+II4(:,:,2)+II4(:,:,3)>0;
% 
% JJ_mni=J.*(1-Is123);
% im_c=cat(3,JJ_mni,JJ_mni,JJ_mni)+II4;
% figure;imshow(im_c)

%Stroke_Predict1(F,M)
% GClist=[9,10,7,8,13,14,19,20,21,22,15,16,11,12,5,6,1,2,17,18,3,4];
% G(1:9)=GClist(1:2:end)
% G(10:18)=GClist(2:2:end);
% GClist=G;
% 1    '/data/users/qifeng/experiment/mask/BGlnRuGuB_bin.nii'
% 2    '/data/users/qifeng/experiment/mask/BGrnRuGuB_bin.nii'
% 3    '/data/users/qifeng/experiment/mask/CereLnRuGuB_bin.nii'
% 4    '/data/users/qifeng/experiment/mask/CereRnRuGuB_bin.nii'
% 5    '/data/users/qifeng/experiment/mask/InsulaLnRuGuB_bin.nii'
% 6    '/data/users/qifeng/experiment/mask/InsulaRnRuGuB_bin.nii'
% 7    '/data/users/qifeng/experiment/mask/PreLnRuGuBu_bin.nii'
% 8    '/data/users/qifeng/experiment/mask/PreRnRuGuBu_bin.nii'
% 9    '/data/users/qifeng/experiment/mask/PrilnRuGuB_bin.nii'
% 10   '/data/users/qifeng/experiment/mask/PrirnRuGuB_bin.nii'
% 11   '/data/users/qifeng/experiment/mask/S1LnRuGuBu_bin.nii'
% 12   '/data/users/qifeng/experiment/mask/S1RnRuGuBu_bin.nii'
% 13    '/data/users/qifeng/experiment/mask/SMALnRuGuB_bin.nii'
% 14    '/data/users/qifeng/experiment/mask/SMARnRuGuB_bin.nii'
% 15    '/data/users/qifeng/experiment/mask/SPClnRuGuB_bin.nii'
% 16    '/data/users/qifeng/experiment/mask/SPCrnRuGuB_bin.nii'
% 17    '/data/users/qifeng/experiment/mask/ThalalnRuGuB_bin.nii'
% 18    '/data/users/qifeng/experiment/mask/ThalarnRuGuB_bin.nii'
%101    '/data/users/qifeng/experiment/mask/backup/BG_L.nii'
%102     '/data/users/qifeng/experiment/mask/backup/BG_R.nii'
%103     '/data/users/qifeng/experiment/mask/backup/Cere_L.nii'
%104     '/data/users/qifeng/experiment/mask/backup/Cere_R.nii'
%105     '/data/users/qifeng/experiment/mask/backup/Insula_L.nii'
%106     '/data/users/qifeng/experiment/mask/backup/Insula_R.nii'
%107     '/data/users/qifeng/experiment/mask/backup/Pre_L.nii'
%108     '/data/users/qifeng/experiment/mask/backup/Pre_R.nii'
%109     '/data/users/qifeng/experiment/mask/backup/Pri_L.nii'
%110     '/data/users/qifeng/experiment/mask/backup/Pri_R.nii'
%111     '/data/users/qifeng/experiment/mask/backup/S1_L.nii'
%112     '/data/users/qifeng/experiment/mask/backup/S1_R.nii'
%113     '/data/users/qifeng/experiment/mask/backup/SMA_L.nii'
%114     '/data/users/qifeng/experiment/mask/backup/SMA_R.nii'
%115     '/data/users/qifeng/experiment/mask/backup/SPC_L.nii'
%116     '/data/users/qifeng/experiment/mask/backup/SPC_R.nii'
%117     '/data/users/qifeng/experiment/mask/backup/Thala_L.nii'
%118     '/data/users/qifeng/experiment/mask/backup/Thala_R.nii'


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

%     Node{1}.x= 7+rr*(rand-0.5);
%     Node{1}.y= 5+rr*(rand-0.5) ;
% 
%     Node{2}.x= 4 +rr*(rand-0.5);
%     Node{2}.y= 5 +rr*(rand-0.5);
% 
%     Node{3}.x= 7+rr*(rand-0.5) ;
%     Node{3}.y=  2+rr*(rand-0.5);
% 
%     Node{4}.x= 5+rr*(rand-0.5) ;
%     Node{4}.y= 2 +rr*(rand-0.5);
% 
%     Node{5}.x=  8+rr*(rand-0.5);
%     Node{5}.y=  8+rr*(rand-0.5);
% 
%     Node{6}.x= 4 +rr*(rand-0.5);
%     Node{6}.y=  8+rr*(rand-0.5);
% 
%     Node{7}.x= 9 +rr*(rand-0.5);
%     Node{7}.y= 7 +rr*(rand-0.5);
% 
%     Node{8}.x= 3 +rr*(rand-0.5);
%     Node{8}.y= 7 +rr*(rand-0.5);
% 
%     Node{9}.x= 10 +rr*(rand-0.5);
%     Node{9}.y= 6 +rr*(rand-0.5);
% 
%     Node{10}.x=  2+rr*(rand-0.5);
%     Node{10}.y= 6 +rr*(rand-0.5);
% 
%     Node{11}.x= 10 +rr*(rand-0.5);
%     Node{11}.y=  4+rr*(rand-0.5);
% 
%     Node{12}.x= 2 +rr*(rand-0.5);
%     Node{12}.y= 4 +rr*(rand-0.5);
% 
%     Node{13}.x= 6 +rr*(rand-0.5);
%     Node{13}.y=  7+rr*(rand-0.5);
% 
%     Node{14}.x= 5 +rr*(rand-0.5);
%     Node{14}.y= 7 +rr*(rand-0.5);
% 
%     Node{15}.x= 6 +rr*(rand-0.5);
%     Node{15}.y= 4 +rr*(rand-0.5);
% 
%     Node{16}.x= 5+rr*(rand-0.5) ;
%     Node{16}.y=  4+rr*(rand-0.5);
% 
%     Node{17}.x= 9 +rr*(rand-0.5);
%     Node{17}.y=  3+rr*(rand-0.5);
% 
%     Node{18}.x=  3+rr*(rand-0.5);
%     Node{18}.y=  3+rr*(rand-0.5);
% 
%     Node{19}.x= 8.5 +rr*(rand-0.5);
%     Node{19}.y= 9 +rr*(rand-0.5);
% 
%     Node{20}.x= 3.5+rr*(rand-0.5) ;
%     Node{20}.y= 9+rr*(rand-0.5);
% 
%     Node{21}.x= 8 +rr*(rand-0.5);
%     Node{21}.y=  1+rr*(rand-0.5);
% 
%     Node{22}.x=  4+rr*(rand-0.5);
%     Node{22}.y=  1+rr*(rand-0.5);


%     GC_connection_graph(a,Node{GClist});
%     display_GC(a,GClist,NodeList,barscale,cmin,cmax)
%     GC_connection_graph(b,Node{GClist});
%     display_GC(b,GClist,NodeList,barscale,cmin,cmax) 
%     GC_connection_graph(c,Node{GClist});GCCA
%     display_GC(c,GClist,NodeList,barscale,cmin,cmax)
%     GC_connection_graph(d,Node{GClist});
%     display_GC(d,GClist,NodeList,barscale,cmin,cmax)
%     GC_connection_graph(e,Node{GClist});
%     display_GC(e,GClist,NodeList, cmax=barscale,cmin,cmax)
%     GC_connection_graph(f,Node{GClist});
%     display_GC(f,GClist,NodeList,barscale,cmin,cmax)


