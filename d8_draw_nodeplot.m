function d8_draw_nodeplot(nameTP2,nameTP3,selectedIndex,flim,alpha,RS)

cd /Users/fengqi/Documents/experiment
load patient-mask.mat
cd /Users/fengqi/Documents/experiment/Data/ts

load(nameTP2);
S2=FF;
load(nameTP3);
sz=size(FF);
S3=FF;

[h,p]=ttest(reshape(S3-S2,42*42,sz(3))');
smean=mean(S3-S2,3);
szz=size(S3);
ssstd=nanstd(reshape(S3-S2,42*42,szz(3))');
sstd=reshape(ssstd,42,42);
pm=reshape(p,42,42);
shm=single(pm<0.05);
Sdiff=shm.*smean;

figure
imagesc (Sdiff(selectedIndex,selectedIndex),[-flim,flim])
colormap jet
colorbar
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(selectedIndex)}}
ax.XTickLabelRotation=90
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(selectedIndex)}}
title(strcat(RS,'-diff'));
colorbar
qf_colormap_redblue([-0.02,0.02]);


sz1=size(Sdiff(selectedIndex,selectedIndex));


figure 
hold on

theta=0:2*pi/sz1(2):2*pi;
R=500;
centers=cat(1,R*sin(theta(1:sz1(2))),R*cos(theta(1:sz1(2))));

for ii=1:sz1(2)
    r=100;
    ang=0:0.01:2*pi; 
    xx=centers(1,ii);
    yy=centers(2,ii);
    xp=r*cos(ang);
    yp=r*sin(ang);
    plot(xx+xp,yy+yp,'k');
end
axis equal
xlim([-1000,1000])
ylim([-1000,1000])
R=500+170;
centers=cat(1,R*sin(theta(1:sz1(2))),R*cos(theta(1:sz1(2))));
for ii=1:sz1(2)
text(centers(1,ii),centers(2,ii),maskname{seqindex(selectedIndex(ii))}([1,2,3,7,8]));
end



BA=smean(selectedIndex,selectedIndex);%S3-S2. BA(tgt,source)
BAs=sstd(selectedIndex,selectedIndex);%S3-S2. BA(tgt,source)
Sig=shm(selectedIndex,selectedIndex);
p=pm(selectedIndex,selectedIndex);

%
for ss=1:sz1(2) %ss source index. tt taget index
    nodeN{ss}=maskname{seqindex(selectedIndex(ss))}([1,2,3,7,8]);
    for tt=1:sz1(2)
        
        if tt==ss
        else
           ba=BA(tt,ss);
            thick=300;
            disp(strcat(maskname{seqindex(selectedIndex(ss))},'->',maskname{seqindex(selectedIndex(tt))},':   ',num2str(ba)))
            xa=[];xb=[];ya=[];yb=[];
            if tt>ss
                R=500-30;
                centers=cat(1,R*sin(theta(1:sz1(2))),R*cos(theta(1:sz1(2))));
            else
                R=500+60;
                centers=cat(1,R*sin(theta(1:sz1(2))),R*cos(theta(1:sz1(2))));
            end
                
            xa=centers(1,tt);
            ya=centers(2,tt);
            xb=centers(1,ss);
            yb=centers(2,ss); 
            p2=[xa,ya];
            p1=[xb,yb];
            dp=p2-p1;
            if ba>0
            quiver(p1(1),p1(2),dp(1),dp(2),'r','LineWidth', ba*thick)
            plot([xa,xb],[ya,yb],'r','LineWidth', ba*thick)
            else
             quiver(p1(1),p1(2),dp(1),dp(2),'b','LineWidth', -ba*thick)
            plot([xa,xb],[ya,yb],'b','LineWidth', -ba*thick)  
            end
       
            
        end
    end
end


title(RS)
disp(RS)
SG1=digraph((Sig.*BA)',nodeN);
SG2=digraph((BA)',nodeN);
SG3=digraph(p',nodeN);
SG4=digraph((BAs)',nodeN);
%SG.Edges
disp('mean')
SG2.Edges
disp('std')
SG4.Edges
disp('p')
SG3.Edges
disp('Causaility.*sig')
SG1.Edges