function d7_draw_3nodes(prefix)

switch nargin
    case 1
name{1}=strcat(prefix,'GC_C_La_TP2.mat');
name{2}=strcat(prefix,'GC_S_La_TP2.mat');
name{3}=strcat(prefix,'GC_S_La_TP3.mat');
name{4}=strcat(prefix,'GC_R_La_TP2.mat');
name{5}=strcat(prefix,'GC_R_La_TP3.mat');
    otherwise
name{1}='GC_C_La_TP2.mat';
name{2}='GC_S_La_TP2.mat';
name{3}='GC_S_La_TP3.mat';
name{4}='GC_R_La_TP2.mat';
name{5}='GC_R_La_TP3.mat';
  
end


cd /Users/fengqi/Documents/experiment
load patient-mask.mat
cd /Users/fengqi/Documents/experiment/Data/ts
flim=0.02;
alpha=0.01;
selectedIndex=[1,2,3,4,5,6,7,8,10,16,20,22,23,24,25,26,27,28,29,31,37,41];
%[1 vis_L,  2 S1_L,	3 Pri_L,4 Pre_L,5 SMA_L,6 PFC_L,7 SPC_L,8 INS_L,..
%10 Tha_Pre_L,16 BG_Lim_L,20 Cer_a8_L,
%22 vis_R,23 S1_R,24 Pri_R,25Pre_R,26SMA_R,27PRF_R,28SPC_R,29INS_R,
%31Tha_Pre_R,37BG_lim_R,41Cer_a8_R];
selectedIndex=1:42;

load(name{4});
R2=FF;
load(name{5});
sz=size(FF);
R3=FF;
[h,p]=ttest(reshape(R3-R2,42*42,sz(3))');
rmean=mean(R3-R2,3);
pm=reshape(p,42,42);
rhm=single(pm<0.05);
Rdiff=rhm.*rmean;

figure
imagesc (Rdiff(selectedIndex,selectedIndex),[-flim,flim])
colormap jet
colorbar
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndex)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndex)}}
title(strcat('R-diff'));

qf_colormap_redblue([-0.01,0.01])

alpha=0.01
load(name{4});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm< alpha);
GR=hm.*fmean;

load(name{5});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm< alpha);
BR=hm.*fmean;


figure
imagesc (BR-GR,[-flim,flim])
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(1:42)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(1:42)}}
title(strcat('union_R-diff'));
qf_colormap_redblue([-0.01,0.01])

selectedIndex=[1,2,3,4,5,6,7,8,10,14,21,22,23,24,25,26,27,28,29,31,35,42];

%[1 vis_L,  2 S1_L,	3 Pri_L,4 Pre_L,5 SMA_L,6 PFC_L,7 SPC_L,8 INS_L,..
%10 Tha_Pre_L,16 BG_Lim_L,21 Cer_b8_L,
%22 vis_R,23 S1_R,24 Pri_R,25Pre_R,26SMA_R,27PRF_R,28SPC_R,29INS_R,
%31Tha_Pre_R,37BG_lim_R,42Cer_b8_R];

selectedIndex=[24,25,26]
%d8_draw_nodeplot(name{2},name{3},selectedIndex,flim,alpha,'S')
d8_draw_nodeplot(name{4},name{5},selectedIndex,flim,alpha,'R')

selectedIndex=[19,25,30,29,27]
d8_draw_nodeplot(name{2},name{3},selectedIndex,flim,alpha,'S')
d8_draw_nodeplot(name{4},name{5},selectedIndex,flim,alpha,'R')
