function d6_draw_GCarrows_Group(prefix)

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
A = imread('GCframeblack.jpg');
%imshow(A)
[centers, radii, metric] = imfindcircles(255-A,[20 30]);
%viscircles(centers, radii,'EdgeColor','b');

    
load(name{1});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm<0.01);
RR=hm.*fmean;

load(name{2});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm<0.01);
GS=hm.*fmean;

load(name{3});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm<0.01);
BS=hm.*fmean;

load(name{4});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm<0.01);
GR=hm.*fmean;

load(name{5});
sz=size(FF);
[h,p]=ttest(reshape(FF,42*42,sz(3))');
fmean=mean(FF,3);
pm=reshape(p,42,42);
hm=single(pm<0.01);
BR=hm.*fmean;

mm=max(max(cat(2,RR,GS,BS,GR,BR)));
RR=RR';GG=GS';BB=BS';
figure
imshow(A)
hold on
for jj=1:42  
    for ii=1:42       
   
        if ii==jj
        else
        
            if RR(ii,jj)>0|BB(ii,jj)>0|GG(ii,jj)>0
            
             if isnan(RR(ii,jj))
                 RR(ii,jj)=0;
             end    
             if isnan(BB(ii,jj))
                 BB(ii,jj)=0;
             end   
             if isnan(GG(ii,jj))
                 GG(ii,jj)=0;
             end   
            iii=seqi{ii};jjj=seqi{jj};
            xa=[];xb=[];ya=[];yb=[];
            xa=centers(iii,1);
            ya=centers(iii,2);
            xb=centers(jjj,1);
            yb=centers(jjj,2); 
            p1=[xa,ya];
            p2=[xb,yb];
            dp=p2-p1;
            quiver(p1(1),p1(2),dp(1),dp(2),'Color',[RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm,'LineWidth', 1)
            plot([xa,xb],[ya,yb],'Color',[RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm,'LineWidth', 1)
            else 
            end
        end
    end
    
end


RR=RR';GG=GR';BB=BR';
figure
imshow(A)
hold on
for jj=1:42  
    for ii=1:42       
   
        if ii==jj
        else
        
            if RR(ii,jj)>0|BB(ii,jj)>0|GG(ii,jj)>0
            
             if isnan(RR(ii,jj))
                 RR(ii,jj)=0;
             end    
             if isnan(BB(ii,jj))
                 BB(ii,jj)=0;
             end   
             if isnan(GG(ii,jj))
                 GG(ii,jj)=0;
             end   
            iii=seqi{ii};jjj=seqi{jj};
            xa=[];xb=[];ya=[];yb=[];
            xa=centers(iii,1);
            ya=centers(iii,2);
            xb=centers(jjj,1);
            yb=centers(jjj,2); 
            p1=[xa,ya];
            p2=[xb,yb];
            dp=p2-p1;
            quiver(p1(1),p1(2),dp(1),dp(2),'Color',[RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm,'LineWidth', 1)
            plot([xa,xb],[ya,yb],'Color',[RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm,'LineWidth', 1)
            else 
            end
        end
    end
    
end






