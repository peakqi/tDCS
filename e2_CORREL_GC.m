function e2_CORREL_GC(prefix)

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

clin=[51	51	15.7	17.3	0.76	0.68
29	42	6.3	8.3	0.86	0.57
38	42	5	5.7	NaN	NaN
26	31	3.7	4	0.80	0.68
39	46	4	4	NaN	NaN
31	31	3.1	3.3	0.79	0.72
41	48	8	8.7	NaN	NaN
40	44	6	3.3	NaN	NaN
30	40	3	2.6	NaN	NaN
					
33	45	16	14	0.80	0.90
36	39	4.7	5.7	NaN	NaN
41	57	2	1.3	0.91	0.84
23	26	2	1.6	NaN	NaN
29	28	2	5	NaN	NaN
28	37	5.3	9	NaN	NaN
43	46	4	1	0.60	0.65
]


flim=1
selectedIndex=[1,2,3,4,5,6,7,8,10,16,20,22,23,24,25,26,27,28,29,31,37,41];
%[1 vis_L,  2 S1_L,	3 Pri_L,4 Pre_L,5 SMA_L,6 PFC_L,7 SPC_L,8 INS_L,..
%10 Tha_Pre_L,16 BG_Lim_L,20 Cer_a8_L,
%22 vis_R,23 S1_R,24 Pri_R,25Pre_R,26SMA_R,27PRF_R,28SPC_R,29INS_R,
%31Tha_Pre_R,37BG_lim_R,41Cer_a8_R];
selectedIndex=1:42;

load(name{2});
S2=FF; s2=reshape(S2,42*42,7)';
load(name{3});
S3=FF; s3=reshape(S3,42*42,7)';
load(name{4});
R2=FF; r2=reshape(R2,42*42,9)';
load(name{5});
R3=FF; r3=reshape(R3,42*42,9)';
RS32_causality=cat(1,(r3-r2)./(r3+r2),(s3-s2)./(s3+s2));
%RS32_causality=cat(1,(r3-r2),(s3-s2));
rr=[];
pp=[];
for jj=1:3
   
    rr=[];
    pp=[];
    %diff=clin(:,2*jj)-clin(:,2*jj-1);
    diff=(clin(:,2*jj)-clin(:,2*jj-1))./(clin(:,2*jj)+clin(:,2*jj-1));
     if jj==1 % FMA
        text1='FMA';
    elseif jj==2% grip
         text1='grip';
    elseif jj==3%RMT
         text1='RMT';
         
    else
     end
    ind=find(~isnan(diff));
    
    for ii=1:42*42
    [R,P]=corrcoef(RS32_causality(ind,ii),diff(ind));
    rr=cat(2,rr,R(1,2));
    pp=cat(2,pp,P(1,2));
    end
    
    
    ss=(pp<0.05);
    ssrr=reshape(rr,42,42);

    figure
    imagesc (ssrr(selectedIndex,selectedIndex),[-flim,flim]);
    colorbar
    ax=gca;
    ax.XTick=(1:42);
    ax.XTickLabel={maskname{seqindex(selectedIndex)}};
    ax.XTickLabelRotation=90;
    ax.YTick=(1:42);
    ax.YTickLabel={maskname{seqindex(selectedIndex)}};
    title(strcat(text1,'-CausalityT3T2'));
    qf_colormap_redblue([-1,1]);
    
    c1=cat(1,squeeze(R3(25,19,:)-R2(25,19,:)),squeeze(S3(19,25,:)-S2(19,25,:)));
    c2=cat(1,squeeze(R3(24,25,:)-R2(24,25,:)),squeeze(S3(24,25,:)-S2(24,25,:)));
    disp(text1)
  
    [R,P]=corrcoef(c1(ind),diff(ind));
    disp(strcat(maskname{seqindex(19)}([1,2,3,4,8]),'->',maskname{seqindex(25)}([1,2,3,4,8])))
    disp(strcat('corr=',num2str(R(2,1)),'; p=',num2str(P(2,1))))
  
    [R,P]=corrcoef(c2(ind),diff(ind));
    disp(strcat(maskname{seqindex(25)}([1,2,3,4,8]),'->',maskname{seqindex(24)}([1,2,3,4,8]))) 
    disp(strcat('corr=',num2str(R(2,1)),'; p=',num2str(P(2,1))))
    figure
    hold on

scatter(diff,c1,'r')
sz=size(ind);
for ii=1:sz(1)
    text(diff(ind(ii)),c1(ind(ii)),num2str(ind(ii)),'Color','red')    
end

scatter(diff,c2,'b')
for ii=1:sz(1)
    text(diff(ind(ii)),c2(ind(ii)),num2str(ind(ii)),'Color','blue')    
end
    
end




% RS32_grip=cat(1,grip_R(:,2)-grip_R(:,1),grip_S(:,2)-grip_S(:,1));
% rr=[];
% pp=[]
% for ii=1:42*42
% [R,P]=corrcoef(RS32_causality(:,ii),RS32_grip);
% rr=cat(2,rr,R(1,2));
% pp=cat(2,pp,P(1,2));
% end
% ss=(pp<0.05);
% ssrr=reshape(rr,42,42);
% 
% figure
% imagesc (ssrr(selectedIndex,selectedIndex),[-flim,flim])
% colorbar
% ax=gca;
% ax.XTick=(1:42);
% ax.XTickLabel={maskname{seqindex(selectedIndex)}}
% ax.XTickLabelRotation=90
% ax.YTick=(1:42);
% ax.YTickLabel={maskname{seqindex(selectedIndex)}}
% title(strcat('grip-CausalityT3T2'));
% qf_colormap_redblue([-1,1])

selectindex=[24,25,26];%[19,25,30,29,27]
%[1 vis_L,  2 S1_L,	3 Pri_L,4 Pre_L,5 SMA_L,6 PFC_L,7 SPC_L,8 INS_L,..
%10 Tha_Pre_L,16 BG_Lim_L,21 Cer_b8_L,
%22 vis_R,23 S1_R,24 Pri_R,25Pre_R,26SMA_R,27PRF_R,28SPC_R,29INS_R,
%31Tha_Pre_R,37BG_lim_R,42Cer_b8_R];







