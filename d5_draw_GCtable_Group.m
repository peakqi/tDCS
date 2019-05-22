function d5_draw_GCtable_Group(prefix)
switch nargin
    case 1
name{1}=strcat(prefix,'GC_C_La_TP2.mat');
name{2}=strcat(prefix,'GC_S_La_TP2.mat');
name{3}=strcat(prefix,'GC_S_La_TP3.mat');
name{4}=strcat(prefix,'GC_R_La_TP2.mat');
name{5}=strcat(prefix,'GC_R_La_TP3.mat');
name{6}=strcat(prefix,'GC_RS_La_TP2.mat');
name{7}=strcat(prefix,'GC_RS3_La_TP3.mat');
    otherwise
name{1}='GC_C_La_TP2.mat';
name{2}='GC_S_La_TP2.mat';
name{3}='GC_S_La_TP3.mat';
name{4}='GC_R_La_TP2.mat';
name{5}='GC_R_La_TP3.mat';
name{6}='GC_RS_La_TP2.mat';
name{7}='GC_RS3_La_TP2.mat';
end

addpath(genpath('/Users/fengqi/Documents/MATLAB/qf_function'))
cd /Users/fengqi/Documents/experiment
load patient-mask.mat
cd /Users/fengqi/Documents/experiment/Data/ts
alpha=0.01
selectedIndextot=1:42;
selectedIndex=[1,2,3,4,5,6,7,8,9,14,19,22,23,24,25,26,27,28,29,30,35,40];
%selectedIndex=[1,2,3,4,5,6,7,8,10,14,19,22,23,24,25,26,27,28,29,31,35,40];
%[1 vis_L,  2 S1_L,	3 Pri_L,4 Pre_L,5 SMA_L,6 PFC_L,7 SPC_L,8 INS_L,..
%10 Tha_Pre_L,16 BG_Lim_L,21 Cer_b8_L,
%22 vis_R,23 S1_R,24 Pri_R,25Pre_R,26SMA_R,27PRF_R,28SPC_R,29INS_R,
%31Tha_Pre_R,37BG_lim_R,42Cer_b8_R];
for ii=1:22
   nodeN{ii}=maskname{seqindex(selectedIndex(ii))}([1,2,3,7,8]); 
end

load(name{1});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm< alpha);
RR=hm.*fmean;
RRf=fmean;RRp=pm;
digraphRR=digraph(RR(selectedIndex,selectedIndex)',nodeN);
digraphRR_p=digraph(pm(selectedIndex,selectedIndex)',nodeN);
digraphRRf=digraph(RRf(selectedIndex,selectedIndex)',nodeN);
disp('RRf')
digraphRRf.Edges
digraphRRp=digraph(RRp(selectedIndex,selectedIndex)',nodeN);
disp('RRp')
digraphRRp.Edges

load(name{2});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm< alpha);
GS=hm.*fmean;
GSf=fmean;GSp=pm;
digraphGS=digraph(GS(selectedIndex,selectedIndex)',nodeN);
digraphGS_p=digraph(pm(selectedIndex,selectedIndex)',nodeN);
digraphGSf=digraph(GSf(selectedIndex,selectedIndex)',nodeN);
disp('GSf')
digraphGSf.Edges
digraphGSp=digraph(GSp(selectedIndex,selectedIndex)',nodeN);
disp('GSp')
digraphGSp.Edges

load(name{3});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
BSf=fmean;
pm=reshape(p,42,42);
BSp=pm;
hm=single(pm< alpha);
BS=hm.*fmean;
BSf=fmean;BSp=pm;
digraphBS=digraph(BS(selectedIndex,selectedIndex)',nodeN);
digraphBS_p=digraph(pm(selectedIndex,selectedIndex)',nodeN);
digraphBSf=digraph(BSf(selectedIndex,selectedIndex)',nodeN);
disp('BSf')
digraphBSf.Edges
digraphBSp=digraph(BSp(selectedIndex,selectedIndex)',nodeN);
disp('BSp')
digraphBSp.Edges

load(name{4});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm< alpha);
GR=hm.*fmean;
GRf=fmean;GRp=pm;
digraphGR=digraph(GR(selectedIndex,selectedIndex)',nodeN);
digraphGR_p=digraph(pm(selectedIndex,selectedIndex)',nodeN);
digraphGRf=digraph(GRf(selectedIndex,selectedIndex)',nodeN);
disp('GRf')
digraphGRf.Edges
digraphGRp=digraph(GRp(selectedIndex,selectedIndex)',nodeN);
disp('GRp')
digraphGRp.Edges


load(name{5});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm< alpha);
BR=hm.*fmean;
BRp=pm;
BRf=fmean;BRp=pm;
digraphBR=digraph(BR(selectedIndex,selectedIndex)',nodeN);
digraphBR_p=digraph(pm(selectedIndex,selectedIndex)',nodeN);
digraphBRf=digraph(BRf(selectedIndex,selectedIndex)',nodeN);
disp('BRf')
digraphBRf.Edges
digraphBRp=digraph(BRp(selectedIndex,selectedIndex)',nodeN);
disp('BRp')
digraphBRp.Edges

load(name{6});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm< alpha);
RS=hm.*fmean;
RSf=fmean;RSp=pm;
digraphRS=digraph(RS(selectedIndex,selectedIndex)',nodeN);
digraphRS_p=digraph(pm(selectedIndex,selectedIndex)',nodeN);
digraphRSf=digraph(RSf(selectedIndex,selectedIndex)',nodeN);
disp('RSf')
digraphRSf.Edges
digraphRSp=digraph(RSp(selectedIndex,selectedIndex)',nodeN);
disp('RSp')
digraphRSp.Edges

load(name{7});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm< alpha);
RS3=hm.*fmean;
RS3f=fmean;RS3p=pm;
digraphRS3=digraph(RS3(selectedIndex,selectedIndex)',nodeN);
digraphRS3_p=digraph(pm(selectedIndex,selectedIndex)',nodeN);
digraphRS3f=digraph(RS3f(selectedIndex,selectedIndex)',nodeN);
disp('RS3f')
digraphRS3f.Edges
digraphRS3p=digraph(RS3p(selectedIndex,selectedIndex)',nodeN);
disp('RS3p')
digraphRSp.Edges


load(name{2});
S2=FF;
load(name{3});
sz=size(FF);
S3=FF;

[h,p]=ttest(reshape(S3-S2,42*42,sz(3))');
smean=mean(S3-S2,3);
pm=reshape(p,42,42);
shm=single(pm<alpha);
Sdiff=shm.*smean;
digraphSdiff=digraph(Sdiff(selectedIndex,selectedIndex)',nodeN);
digraphSdiff_p=digraph((pm(selectedIndex,selectedIndex).*shm(selectedIndex,selectedIndex))',nodeN);


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
digraphRdiff=digraph(Rdiff(selectedIndex,selectedIndex)',nodeN);
digraphRdiff_p=digraph((pm(selectedIndex,selectedIndex).*rhm(selectedIndex,selectedIndex))',nodeN);





%%%%%%
flim=0.02
clim_F=[0,flim];
clim_p=[0,1];


figure
imagesc(cat(3,RR,GS,BS)*100,clim_F)
colormap hot
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndextot)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndextot)}}
title(strcat('S-F'));


titlename=strcat('R','-','La')
figure
imagesc(cat(3,RR,GR,BR)*100,clim_F)
colormap hot
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndextot)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndextot)}}
title(strcat('R-F'));




%%%%




figure
imagesc(cat(3,RR(selectedIndex,selectedIndex),GS(selectedIndex,selectedIndex),...
    BS(selectedIndex,selectedIndex))*100,clim_F)
colormap hot
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndex)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndex)}}
title(strcat('S-F'));

figure
imagesc(cat(3,RR(selectedIndex,selectedIndex),GR(selectedIndex,selectedIndex),...
    BR(selectedIndex,selectedIndex))*100,clim_F)
colormap jet
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndex)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndex)}}
title(strcat('R-F'));
axis equal
digraphRR=digraph(round(RR(selectedIndex,selectedIndex)*300)',nodeN);
disp('RR')
digraphRR.Edges
digraphGS=digraph(round(GS(selectedIndex,selectedIndex)*300)',nodeN);
disp('GS')
digraphGS.Edges
digraphBS=digraph(round(BS(selectedIndex,selectedIndex)*300)',nodeN);
disp('BS')
digraphBS.Edges
digraphGR=digraph(round(GR(selectedIndex,selectedIndex)*300)',nodeN);
disp('GR')
digraphGR.Edges
digraphBR=digraph(round(BR(selectedIndex,selectedIndex)*300)',nodeN);
disp('BR')
digraphBR.Edges
digraphRS=digraph(round(RS(selectedIndex,selectedIndex)*300)',nodeN);
disp('RS')
digraphBR.Edges
digraphRS3=digraph(round(RS3(selectedIndex,selectedIndex)*300)',nodeN);
disp('RS3')
digraphRS3.Edges



digraphRR=digraph(RR(selectedIndex,selectedIndex)',nodeN);
disp('RR')
digraphRR.Edges
digraphGS=digraph(GS(selectedIndex,selectedIndex)',nodeN);
disp('GS')
digraphGS.Edges
digraphBS=digraph(BS(selectedIndex,selectedIndex)',nodeN);
disp('BS')
digraphBS.Edges
digraphGR=digraph(GR(selectedIndex,selectedIndex)',nodeN);
disp('GR')
digraphGR.Edges
digraphBR=digraph(BR(selectedIndex,selectedIndex)',nodeN);
disp('BR')
digraphBR.Edges




S32=S3-S2;
R32=R3-R2;
% rr=GS(selectedIndex,selectedIndex);
% gs=GS(selectedIndex,selectedIndex);
% bs=BS(selectedIndex,selectedIndex);
% gr=GR(selectedIndex,selectedIndex);
% br=BR(selectedIndex,selectedIndex);
% bgs=bs-gs;
% bgr=br-gr;

prepri=squeeze(R32(24,25,:))
prepri=squeeze(R32(25,19,:))
[s,p]=ttest(prepri)
mean(prepri)
std(prepri)/sqrt(9)


figure
imagesc (BS(selectedIndex,selectedIndex)-GS(selectedIndex,selectedIndex),[-flim,flim])
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndex)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndex)}}
title(strcat('S-diff'));
qf_colormap_redblue([-flim,flim])

figure
imagesc (BR(selectedIndex,selectedIndex)-GR(selectedIndex,selectedIndex),[-flim,flim])
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndex)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndex)}}
title(strcat('R-diff'));
qf_colormap_redblue([-flim,flim])


figure
imagesc (Sdiff(selectedIndextot,selectedIndextot),[-flim,flim])
colormap jet
colorbar
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndextot)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndextot)}}
title(strcat('S-diff'));
qf_colormap_redblue([-0.01,0.01])

axis equal

figure
imagesc (Rdiff(selectedIndextot,selectedIndextot),[-flim,flim])
colormap jet
colorbar
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndextot)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndextot)}}
title(strcat('R-diff'));
qf_colormap_redblue([-0.01,0.01])



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

%selectedIndex=[1,2,3,4,5,6,7,8,10,14,19,22,23,24,25,26,27,28,29,31,35,40];
%[1 vis_L,  2 S1_L,	3 Pri_L,4 Pre_L,5 SMA_L,6 PFC_L,7 SPC_L,8 INS_L,..
%10 Tha_Pre_L,16 BG_Lim_L,21 Cer_b8_L,
%22 vis_R,23 S1_R,24 Pri_R,25Pre_R,26SMA_R,27PRF_R,28SPC_R,29INS_R,
%31Tha_Pre_R,37BG_lim_R,42Cer_b8_R];
selected3Node=[3,4,5,24,25,26]
d8_draw_nodeplot(name{2},name{3},selected3Node,flim,alpha,'S')
d8_draw_nodeplot(name{4},name{5},selected3Node,flim,alpha,'R')

selected3Node=[3,9,24,30]
d8_draw_nodeplot(name{2},name{3},selected3Node,flim,alpha,'S')
d8_draw_nodeplot(name{4},name{5},selected3Node,flim,alpha,'R')


selected3Node=[24,25,26]
d8_draw_nodeplot(name{2},name{3},selected3Node,flim,alpha,'S')
d8_draw_nodeplot(name{4},name{5},selected3Node,flim,alpha,'R')
selected3Node=[19,25,30,29,27]
d8_draw_nodeplot(name{2},name{3},selected3Node,flim,alpha,'S')
d8_draw_nodeplot(name{4},name{5},selected3Node,flim,alpha,'R')