function df_GC_TP3_TP2(LRap,RealSham)
%F(ii,jj), arrow from jj->ii
 load patient-mask.mat
cd /Users/fengqi/Documents/experiment/Data/ts
A = imread('GCnolegend.jpg');
[centers, radii, metric] = imfindcircles(255-A,[20 30]);

figure
imshow(A)
hold on
%[centers, radii, metric] = imfindcircles(A,[20 30]);
%viscircles(centers, radii,'EdgeColor','b');



titlename=strcat('C','-',LRap,'-','TP2')
load(strcat(titlename,'-F','.mat'))
R=F;
load(strcat(titlename,'-sig','.mat'))
Rs=sig;
RR=R.*Rs;%sig


titlename=strcat(RealSham,'-',LRap,'-','TP2')
load(strcat(titlename,'-F','.mat'))
R=F;
load(strcat(titlename,'-sig','.mat'))
Rs=sig;
GG=R.*Rs;

titlename=strcat(RealSham,'-',LRap,'-','TP3')
load(strcat(titlename,'-F','.mat'))
R=F;
load(strcat(titlename,'-sig','.mat'))
Rs=sig;
BB=R.*Rs;
sequ={'vis____L','S1_____L',...
    'Pri____L','Pre____L','SMA____L','PFC____L','Prt_7__L' ,'Ins____L'  ,...
    'Tha_M1_L','ThaPre_L', 'ThaPFC_L','Thaprt_L','ThaOcc_L' ,...
    'BG_cM__L','BG_rM__L' ,'BG_lim_L' ,'BG_prt_L',  ...
     'Cer_5__L','Cer_6__L','Cer_8a_L','Cer_8b_L'    ,...
    'vis____R','S1_____R',...
    'Pri____R','Pre____R','SMA____R','PFC____R','Prt_7__R' ,'Ins____R'  ,...
    'Tha_M1_R','ThaPre_R', 'ThaPFC_R','Thaprt_R','ThaOcc_R' ,...
    'BG_cM__R','BG_rM__R' ,'BG_lim_R' ,'BG_prt_R',  ...
     'Cer_5__R','Cer_6__R','Cer_8a_R','Cer_8b_R'    
        }
    
 seqi={ 7,16,...
            10,12,20,19,2 ,15  ,...
            9,9, 9,9,9 ,...
            14,14,14 ,14,  ...
             21,21,21,21    ,...
            11,18,...
            22,6,17,5,3 ,4  ,...
            1,1, 1,1,1 ,...
            8,8 ,8 ,8,  ...
             13,13,13,13  
     }
 

    for ii=1:42
        for jj=1:42
            if strcmp(maskname{jj},sequ{ii})
               seqindex(ii)=jj;
               break;
            end
            
        end
    end
%RR=RR';GG=GG';BB=BB';

inc=(BB-GG).*single(BB>GG)*0;%RR
dec=(GG-BB).*single(BB<GG);%BB
zz=RR*0;%GG
mm=0.05;%max(max(cat(2,inc,zz,dec)));
mm=max(max(cat(2,RR,GG,BB)));
for ii=1:42  
    for  jj=1:42    
   
        if ii==jj
        else
        if dec(ii,jj)==0&inc(ii,jj)==0&zz(ii,jj)==0
        else
            
           
            [sequ{ii} '---->' sequ{jj}]
%            [RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm
%            lin=RR*0;;aaaa=RR(ii,jj)+BB(ii,jj)+GG(ii,jj)
%            lin(ii,jj)=aaaa;
            iii=seqi{ii};jjj=seqi{jj};
          
            xa=[];xb=[];ya=[];yb=[];
            xa=centers(iii,1);
            ya=centers(iii,2);
            xb=centers(jjj,1);
            yb=centers(jjj,2); 
            p2=[xa,ya];
            p1=[xb,yb];
            dp=p2-p1;
%             d52_RGB_GC(lin,maskname,seqindex);
%             figure
%             imshow(A)
%             hold on
            quiver(p1(1),p1(2),dp(1),dp(2),'LineWidth',dec(ii,jj)/mm*2,'Color',[0,0,1]);
            plot([xa,xb],[ya,yb],'LineWidth',dec(ii,jj)/mm*2,'Color',[0,0,1]);
       % [zz(ii,jj) inc(ii,jj) dec(ii,jj)]
        qqq=1;
%             quiver(p1(1),p1(2),dp(1),dp(2),'Color',[RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm,'LineWidth', 1)
%             plot([xa,xb],[ya,yb],'Color',[RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm,'LineWidth', 1)
%             
            end
        end
    end
    
end

inc=(BB-GG).*single(BB>GG);%RR
dec=(GG-BB).*single(BB<GG)*0;%BB
zz=RR*0;%GG
mm=0.05;%max(max(cat(2,inc,zz,dec)));
mm=max(max(cat(2,RR,GG,BB)));
for ii=1:42  
    for  jj=1:42    
   
        if ii==jj
        else
        if dec(ii,jj)==0&inc(ii,jj)==0&zz(ii,jj)==0
        else
            
            
            [sequ{ii} '---->' sequ{jj}]
%            [RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm
%            lin=RR*0;;aaaa=RR(ii,jj)+BB(ii,jj)+GG(ii,jj)
%            lin(ii,jj)=aaaa;
            iii=seqi{ii};jjj=seqi{jj};
          
            xa=[];xb=[];ya=[];yb=[];
            xa=centers(iii,1);
            ya=centers(iii,2);
            xb=centers(jjj,1);
            yb=centers(jjj,2); 
            p2=[xa,ya];
            p1=[xb,yb];
            dp=p2-p1;
           % [zz(ii,jj) inc(ii,jj) dec(ii,jj)]
%             d52_RGB_GC(lin,maskname,seqindex);
%             figure
%             imshow(A)
%             hold on
            quiver(p1(1),p1(2),dp(1),dp(2),'LineWidth',inc(ii,jj)/mm*2,'Color',[1,0,0]);
            plot([xa,xb],[ya,yb],'LineWidth',inc(ii,jj)/mm*2,'Color',[1,0,0]);
       %qqq=1;
%             quiver(p1(1),p1(2),dp(1),dp(2),'Color',[RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm,'LineWidth', 1)
%             plot([xa,xb],[ya,yb],'Color',[RR(ii,jj),GG(ii,jj),BB(ii,jj)]/mm,'LineWidth', 1)
%             
            end
        end
    end
    
end
