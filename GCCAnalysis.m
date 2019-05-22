function [F_T2,F_T3,pval_T2,pval_T3]= GCCAnalysis(patientList,GClist)

load CnList
load FileName

sCn=size(CnList);
sG=size(GClist');

for kk=1:sG(1)
    sFile=strcat(patientList.T2Addr,'/',FileName(GClist(kk)));
    fileID = fopen(sFile{1},'r');
    formatSpec='%f';
    X(kk,:)=fscanf(fileID,formatSpec,[1,Inf]);
    fclose(fileID);          
end
[F_T2,pval_T2,sig,morder]=GCCA(X); 






for kk=1:sG(1)
    sFile=strcat(patientList.T3Addr,'/',FileName(GClist(kk)));
    fileID = fopen(sFile{1},'r');
    formatSpec='%f';
    X(kk,:)=fscanf(fileID,formatSpec,[1,Inf]);
    fclose(fileID);          
end

[F_T3,pval_T3,sig,morder]=GCCA(X); 

  
 % for kk=1:sCn(1)
%     for ll=1:sG(1)
%         sFile=strcat(CnList{kk},'/',FileName(ll));
%         fileID = fopen(sFile{1},'r');
%         formatSpec='%f';
%         X(ll,:)=fscanf(fileID,formatSpec,[1,Inf]);
%         fclose(fileID);
%     end
%     [F{kk},pval{kk},sig{kk},morder{kk}]=GCCA(X);
% end
% 
% for ii=1:sG
%     for jj=1:sG
%         
%  %1-10  CN pre             
%         for kk=1:sCn 
%             F_CN{ii,jj}(kk)=F{kk}(ii,jj);
%         end
%         F_CN_mean{ii,jj}(1)=mean(F_CN{ii,jj}(:));
%         F_CN_std{ii,jj}(1)=std(F_CN{ii,jj}(:));
%     end
% end
     
      
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plotindex=0;
% 
% if plotindex==1
% 
% figure
% h=bar3(cell2mat(F_CN_mean),barscale)
% for k = 1:length(h)
%     zdata = get(h(k),'ZData');
%     set(h(k),'CData',zdata,...
%              'FaceColor','interp')
% end
% xlabel('from')
% ylabel('to')
% zlabel('F')
% view([0,90])
% set (gca,'xtick',[1:18],'XTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
%                      FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
%                      FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
%                      FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4)})
% set (gca,'ytick',[1:18],'YTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
%                      FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
%                      FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
%                      FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4)})
% title('CN')
% caxis([cmin,cmax])
% colorbar
% 
% figure
% h=bar3(F_T2,barscale)
% for k = 1:length(h)
%     zdata = get(h(k),'ZData');
%     set(h(k),'CData',zdata,...
%              'FaceColor','interp')
% end
% xlabel('from')
% ylabel('to')
% zlabel('F')
% view([0,90])
% set (gca,'xtick',[1:18],'XTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
%                      FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
%                      FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
%                      FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4)})
% set (gca,'ytick',[1:18],'YTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
%                      FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
%                      FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
%                      FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4)})
% title('T2')
% caxis([cmin,cmax])
% colorbar
% 
% figure
% h=bar3(F_T3,barscale)
% for k = 1:length(h)
%     zdata = get(h(k),'ZData');
%     set(h(k),'CData',zdata,...
%              'FaceColor','interp')
% end
% xlabel('from')
% ylabel('to')
% zlabel('F')
% view([0,90])
% set (gca,'xtick',[1:18],'XTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
%                      FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
%                      FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
%                      FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4)})
% set (gca,'ytick',[1:18],'YTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
%                      FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
%                      FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
%                      FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4)})
% title('T3')
% caxis([cmin,cmax])
% colorbar
% end
