function dd_GC_TP3


cd /Users/fengqi/Documents/experiment/Data/ts
A = imread('GCnolegend.jpg');

A=255-A;
figure
imshow(A)
hold on
[centers, radii, metric] = imfindcircles(A,[20 30]);
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
 

   
RR=RR';GG=GG';BB=BB';
mm=max(max(cat(2,RR,GG,BB)));
for jj=1:42  
    for ii=1:42       
   
        if ii==jj
        else
        
            if RR(ii,jj)==0&BB(ii,jj)==0&GG(ii,jj)==0
            else
            

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
       
            end
        end
    end
    
end
