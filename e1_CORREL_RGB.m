function e1_CORREL_RGB(prefix)

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
cd /Users/fengqi/Documents/experiment/Data/RGB


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



nm{1}='RGB_thr196_R_TP2_La_left_cereb.mat';
nm{2}='RGB_thr196_R_TP2_La_left_motor.mat';
nm{3}='RGB_thr196_R_TP2_La_rightcereb.mat';
nm{4}='RGB_thr196_R_TP2_La_rightmotor.mat';
nm{5}='RGB_thr196_S_TP2_La_left_cereb.mat';
nm{6}='RGB_thr196_S_TP2_La_left_motor.mat';
nm{7}='RGB_thr196_S_TP2_La_rightcereb.mat';
nm{8}='RGB_thr196_S_TP2_La_rightmotor.mat';

cc={'Black','Red','Green','Yellow','Blue','Purple','Cyan','White'};
load (nm{1});
R_cer=RGBstatics;
load (nm{4});
R_motor=RGBstatics;
load (nm{5});
S_cer=RGBstatics;
load (nm{8});
S_motor=RGBstatics;

RS_motor=cat(1,R_motor,S_motor);
RS_cer=cat(1,R_cer,S_cer);





rr=[];
pp=[];
for kk=1:2
    if kk==1   
        color=RS_motor;
        text0='Right Motor';
    else
        color=RS_cer; text0='Left Cerebellum';
    end
    r{kk}=[];
    p{kk}=[];
    for jj=1:3 %FMA grip RMT

        rr=[];
        pp=[];
        

         if jj==1 % FMA
            text1='FMA';
        elseif jj==2% grip
             text1='grip';
        elseif jj==3%RMT
             text1='RMT';

        else
        end
        disp(strcat('left active task, @',text0,',',text1,'-score'))
        
        diff=(clin(:,2*jj)-clin(:,2*jj-1));%./(clin(:,2*jj)+clin(:,2*jj-1));
        
        for ii=1:8
            ind=find(~isnan(diff));
            [R,P]=corrcoef(color(ind,ii),diff(ind));
            rr=cat(2,rr,R(1,2));
            pp=cat(2,pp,P(1,2));
            disp(strcat(cc{ii},'--',text1,':'))
            disp(strcat('corr=',num2str(R(2,1)),'; p=',num2str(P(2,1))))
        end
        r{kk}=cat(1,r{kk},rr);
        p{kk}=cat(1,p{kk},pp);

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
% ax.XTickLabel={mname{seqindex(selectedIndex)}}
% ax.XTickLabelRotation=90
% ax.YTick=(1:42);
% ax.YTickLabel={mname{seqindex(selectedIndex)}}
% title(strcat('grip-CausalityT3T2'));
% qf_colormap_redblue([-1,1])

selectindex=[24,25,26];%[19,25,30,29,27]
%[1 vis_L,  2 S1_L,	3 Pri_L,4 Pre_L,5 SMA_L,6 PFC_L,7 SPC_L,8 INS_L,..
%10 Tha_Pre_L,16 BG_Lim_L,21 Cer_b8_L,
%22 vis_R,23 S1_R,24 Pri_R,25Pre_R,26SMA_R,27PRF_R,28SPC_R,29INS_R,
%31Tha_Pre_R,37BG_lim_R,42Cer_b8_R];







