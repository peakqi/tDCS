function c0_average_RGB(CRS,TP,LR)

a=[]
cd Data/RGB/

if strcmp(CRS,'S')
          for ii=1:7
             
                  
                  strcat(CRS,num2str(ii),'_',TP,'_',LR,'.nii.gz')
                  im=qf_load(strcat(CRS,num2str(ii),'_',TP,'_',LR,'.nii.gz'));
                  if ii==1
                      a=im;
                  else
                      a=a+im;
                  end
             
          end
          a=a/7;
          SliceBrowser(a)
          title(strcat(CRS,'_',TP,'_',LR,'.nii.gz'))
          qf_save(a,strcat(CRS,'_',TP,'_',LR,'.nii.gz'))
    
elseif strcmp(CRS,'S')
          for ii=1:9
             
                  
                  strcat(CRS,num2str(ii),'_',TP,'_',LR,'.nii.gz')
                  im=qf_load(strcat(CRS,num2str(ii),'_',TP,'_',LR,'.nii.gz'));
                  if ii==1
                      a=im;
                  else
                      a=a+im;
                  end
             
          end
          a=a/9;
          SliceBrowser(a)
          title(strcat(CRS,'_',TP,'_',LR,'.nii.gz'))
          qf_save(a,strcat(CRS,'_',TP,'_',LR,'.nii.gz'))
else
         for ii=0:9
              
              im=qf_load(strcat(CRS,num2str(ii),'_',TP,'_',LR,'.nii.gz'));
              if ii==0
                  a=im;
              else
                  a=a+im;
              end
              
          end
          a=a/10;
          qf_save(a,strcat(CRS,'_',TP,'_',LR,'.nii.gz'))
    
            
end      
     
cd ../..
%     c0_average_RGB('S','TP1','La')
% 
%  
% 
%     c0_average_RGB('S','TP1','Lp')
% 
%  
% 
%     c0_average_RGB('S','TP1','Ra')
% 
%  
% 
%     c0_average_RGB('S','TP1','Rp')
% 
%  
% 
%     c0_average_RGB('S','TP2','La')
% 
%  
% 
%     c0_average_RGB('S','TP2','Lp')
% 
%  
% 
%     c0_average_RGB('S','TP2','Ra')
% 
%  
% 
%     c0_average_RGB('S','TP2','Rp')
% 
%  
% 
%     c0_average_RGB('S','TP3','La')
% 
%  
% 
%     c0_average_RGB('S','TP3','Lp')
% 
%  
% 
%     c0_average_RGB('S','TP3','Ra')
% 
%  
% 
%     c0_average_RGB('S','TP3','Rp')
% a=[]
% 
%           for ii=1:9
%               strcat(CRS,num2str(ii),'_',TP,'_',LR,'.nii.gz')
%               im=qf_load(strcat(CRS,num2str(ii),'_',TP,'_',LR,'.nii.gz'));
%               if ii==1
%                   a=im;
%               else
%                   a=a+im;
%               end
%               
%           end
%           a=a/9;
%           qf_save(a,strcat(CRS,'_',TP,'_',LR,'.nii.gz'))
%             
% %             
% %      
% %     c0_average_RGB('R','TP1','La')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP1','Lp')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP1','Ra')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP1','Rp')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP2','La')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP2','Lp')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP2','Ra')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP2','Rp')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP3','La')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP3','Lp')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP3','Ra')
% % 
% %  
% % 
% %     c0_average_RGB('R','TP3','Rp')
% a=[]
% 
%           for ii=0:9
%               
%               im=qf_load(strcat(CRS,num2str(ii),'_',TP,'_',LR,'.nii.gz'));
%               if ii==0
%                   a=im;
%               else
%                   a=a+im;
%               end
%               
%           end
%           a=a/10;
%           qf_save(a,strcat(CRS,'_',TP,'_',LR,'.nii.gz'))
%             
%             
%      c0_average_RGB('C','TP1','La')
% 
%     c0_average_RGB('C','TP1','Lp')
% 
%     c0_average_RGB('C','TP1','Ra')
% 
%     c0_average_RGB('C','TP1','Rp')
% 
%     c0_average_RGB('C','TP2','La')
% 
%     c0_average_RGB('C','TP2','Lp')
% 
%     c0_average_RGB('C','TP2','Ra')
% 
%     c0_average_RGB('C','TP2','Rp')
% 
%   
%     
