
function e_CORREL_FMA_ColorVoxels

load FMMA_GRIP_RMT
load('RGB_thr21_R_TP2_La_rightmotor.mat')
R1=RGBstatics;
load('RGB_thr21_R_TP2_La_left_cereb.mat')
R2=RGBstatics;

load('RGB_thr21_S_TP2_La_rightmotor.mat')
S1=RGBstatics;
load('RGB_thr21_S_TP2_La_left_cereb.mat')
S2=RGBstatics;;

RS=cat(1,R1,S1);
%FMMA_GRIP_RMT=cat(1,FMMA_GRIP_RMT,FMMA_GRIP_RMT);
figure 
hold on
for ii=1:8
    figure 
hold on
 for jj=1:3
     if jj==3
         
    [rFMA{ii},pFMA{ii}]=corrcoef(RS(:,ii),FMMA_GRIP_RMT(:,jj),'rows','complete')
    scatter(RS(:,ii),FMMA_GRIP_RMT(:,jj))
%     f=fit(RS(:,ii),FMMA_GRIP_RMT(:,jj),'poly1')
%      plot(f,RS(:,ii),FMMA_GRIP_RMT(:,jj))
    r(ii,jj)=rFMA{ii}(1,2);
    p(ii,jj)=pFMA{ii}(1,2);
    
     else 
         
         [rFMA{ii},pFMA{ii}]=corrcoef(RS(:,ii),FMMA_GRIP_RMT(:,jj))
    scatter(RS(:,ii),FMMA_GRIP_RMT(:,jj))
%     f=fit(RS(:,ii),FMMA_GRIP_RMT(:,jj),'poly1')
%      plot(f,RS(:,ii),FMMA_GRIP_RMT(:,jj))
    r(ii,jj)=rFMA{ii}(1,2);
    p(ii,jj)=pFMA{ii}(1,2);
     end
 end
end

r
p