function d4_MVGC_single(RealSham,TP,LRap,prefix)

switch nargin
    case 4

    case 3
        prefix='';
  
end

cd /Users/fengqi/Documents/experiment
load patient-mask.mat  
cd /Users/fengqi/Documents/experiment/Data/ts
if strcmp(RealSham,'R')
    s1=1;s2=9;No=9;
elseif strcmp(RealSham,'S')
    s1=1;s2=7;No=7;
elseif strcmp(RealSham,'C')
    s1=0;s2=9;No=10;
else
    str='wrong'
end

 t1=12;t2=89;t=[]
    for tt=0:8
   
    t=cat(2,t,t1+tt*89:t2+tt*89);
    
    end

    

FF=[];PP=[];SS=[];
for ii=s1:s2
    x=[];
%     for kk=1:71
%         if strcmp(dataID{kk},strcat(RealSham,num2str(ii)))
%            name=patientID{kk};
%            break;
%         end
%         
%     end

    for jj=1:42
        ind=seqindex(jj);
        tsname=strcat(strcat(RealSham,num2str(ii)),'_',LRap,'_',TP,'_',maskname{ind}(1:8),'.mat');
        load (tsname) 
        norm_ts=(ts-mean(ts));%/std(ts);
        x(jj,:)=norm_ts;        
    end
    TS=x;
   
    [F,pval,sig,morder]=d3_MVGC(TS(:,t));%TS(:,t)
    FF=cat(3,FF,F);
    PP=cat(3,PP,pval);
    SS=cat(3,SS,sig);
    ii
end
FF1-FF

save(strcat(prefix,'GC_',RealSham,'_',LRap,'_',TP,'.mat'),'FF','PP','SS')
%
% d4_MVGC_single('C','TP2','La');
% d4_MVGC_single('S','TP2','La');d4_MVGC_single('S','TP3','La');
% d4_MVGC_single('R','TP2','La');d4_MVGC_single('R','TP3','La');
%[F,pval,sig,morder]=d3_MVGC(X);

%   Columns 1 through 5
%     'BG_cM__L'    'Cer_8b_L'    'SMA____L'    'BG_cM__R'    'Cer_8b_R'
%   Columns 6 through 10
%     'SMA____R'    'BG_lim_L'    'Ins____L'    'ThaOcc_L'    'BG_lim_R'
%   Columns 11 through 15
%     'Ins____R'    'ThaOcc_R'    'BG_prt_L'    'PFC____L'    'ThaPFC_L'
%   Columns 16 through 20
%     'BG_prt_R'    'PFC____R'    'ThaPFC_R'    'BG_rM__L'    'Pre____L'
%   Columns 21 through 25
%     'ThaPre_L'    'BG_rM__R'    'Pre____R'    'ThaPre_R'    'Cer_5__L'
%   Columns 26 through 30
%     'Pri____L'    'Tha_M1_L'    'Cer_5__R'    'Pri____R'    'Tha_M1_R'
%   Columns 31 through 35
%     'Cer_6__L'    'Prt_7__L'    'Thaprt_L'    'Cer_6__R'    'Prt_7__R'
%   Columns 36 through 40 
%     'Thaprt_R'    'Cer_8a_L'    'S1_____L'    'vis____L'    'Cer_8a_R' 
%   Columns 41 through 42
%     'S1_____R'    'vis____R'

 
% 
% sequ={'vis____L','S1_____L',...
%     'Pri____L','Pre____L','SMA____L','PFC____L','Prt_7__L' ,'Ins____L'  ,...
%     'Tha_M1_L','ThaPre_L', 'ThaPFC_L','Thaprt_L','ThaOcc_L' ,...
%     'BG_cM__L','BG_rM__L' ,'BG_lim_L' ,'BG_prt_L',  ...
%      'Cer_5__L','Cer_6__L','Cer_8a_L','Cer_8b_L'    ,...
%     'vis____R','S1_____R',...
%     'Pri____R','Pre____R','SMA____R','PFC____R','Prt_7__R' ,'Ins____R'  ,...
%     'Tha_M1_R','ThaPre_R', 'ThaPFC_R','Thaprt_R','ThaOcc_R' ,...
%     'BG_cM__R','BG_rM__R' ,'BG_lim_R' ,'BG_prt_R',  ...
%      'Cer_5__R','Cer_6__R','Cer_8a_R','Cer_8b_R'    
%         }
%     
%     for ii=1:42
%         for jj=1:42
%             if strcmp(maskname{jj},sequ{ii})
%                seqindex(ii)=jj;
%                break;
%             end
%             
%         end
%     end
% 
% % %%
% titlename=strcat(RealSham,'-',LRap,'-',TP)
% clim_F=[0,0.05];
% clim_p=[0,1];
% 
% figure
% imagesc(F,clim_F)
% colormap hot
% ax=gca;
% ax.XTick=(1:42);
% ax.XTickLabel={maskname{seqindex(1:42)}}
% ax.XTickLabelRotation=90
% ax.YTick=(1:42);
% ax.YTickLabel={maskname{seqindex(1:42)}}
% title(strcat(titlename,'-F'));
% colorbar
% xlabel('from')
% ylabel('to')
% colormap gray
% 
% savefig(strcat(titlename,'-F','.fig'));
% save(strcat(titlename,'-F','.mat'),'F');
% 
% figure
% imagesc(1-pval,clim_p)
% colormap hot
% ax=gca;
% ax.XTick=(1:42);
% ax.XTickLabel={maskname{seqindex(1:42)}}
% ax.XTickLabelRotation=90
% ax.YTick=(1:42);
% ax.YTickLabel={maskname{seqindex(1:42)}}
% title(strcat(titlename,'-(1-p)'));
% colorbar
% xlabel('from')
% ylabel('to')
% colormap gray
% savefig(strcat(titlename,'-(1-p)','.fig'));
% save(strcat(titlename,'-pval','.mat'),'pval');
% 
% figure
% imagesc(sig)
% colormap hot
% ax=gca;
% ax.XTick=(1:42);
% ax.XTickLabel={maskname{seqindex(1:42)}}
% ax.XTickLabelRotation=90
% title(titlename);
% ax.YTick=(1:42);
% ax.YTickLabel={maskname{seqindex(1:42)}}
% ax.YTickLabelRotation=0;
% title(strcat(titlename,'-sig'));
% xlabel('from')
% ylabel('to')
% colormap gray
% savefig(strcat(titlename,'-sig','.fig'));
% save(strcat(titlename,'-sig','.mat'),'sig');
% colorbar

% close all;d4_MVGC_whole('C','TP2','La');
% d4_MVGC_whole('R','TP2','La');d4_MVGC_whole('R','TP3','La');
% d4_MVGC_whole('S','TP2','La');d4_MVGC_whole('S','TP3','La');