function displayT3_T2



barscale=.5;cmax=0.1;cmin=-0.1;
load tdcs
tdcst2=b;
tdcst3=c;
tdcst3t2=e;
tdcssigt2=sigT2;
tdcssigt3=sigT3;
load sham
shamt2=b;
shamt3=c;
shamt3t2=e;
shamsigt2=sigT2;
shamsigt3=sigT3;
load tdcsRA
tdcst2RA=b;
tdcst3RA=c;
tdcst3t2RA=e;
display_GC(shamt3t2,GClist,NodeList,barscale,cmin,cmax);
display_GC(tdcst3t2,GClist,NodeList,barscale,cmin,cmax);
display_GC(tdcst3t2RA,GClist,NodeList,barscale,cmin,cmax);

tdcssigt2=sigT2;
tdcssigt3=sigT3;
tdcs_sham=tdcst3t2-shamt3t2;

sig=shamsigt2+shamsigt3+tdcssigt2+tdcssigt3;
M=max(max(sig));
m=min(min(sig));



% sigtdcs=tdcssigt2+tdcssigt3;
% M=max(max(sigtdcs));
% m=min(min(sigtdcs));
display_GC(sig,GClist,NodeList,barscale,m,M)
thre=0.4;
filter=max(sig,thre)>thre;

eftdcs=filter.*tdcst3t2;

display_GC(eftdcs,GClist,NodeList,barscale,cmin,cmax)
GC_connection_graph(eftdcs,Node,GClist)



sig=shamsigt2+shamsigt3+tdcssigt2+tdcssigt3;
M=max(max(sig));
m=min(min(sig));
display_GC(sig,GClist,NodeList,barscale,m,M)

thre=0.4
filter=max(sig,thre)>thre;

ef=filter.*tdcs_sham;

display_GC(ef,GClist,NodeList,barscale,cmin,cmax)
GC_connection_graph(ef,Node,GClist)