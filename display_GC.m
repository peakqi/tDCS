function display_GC(F,GClist,FileName,barscale,cmin,cmax)
Ff=F;

cmi=cmin;
cma=cmax;
F=F-cmin;
cmax=cmax-cmin;
cmin=0;
sf=size(F);


if sf(1)==22
    figure
    h=bar3(F,barscale)
    for k = 1:length(h)
        zdata = get(h(k),'ZData');
        set(h(k),'CData',zdata...
                  ,'FaceColor','interp')
    end


    xlabel('from')
    ylabel('to')
    zlabel('F')
    view([0,90])
    set (gca,'xtick',[1:sf(1)],'XTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
                         FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
                         FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
                         FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4),...
                         FileName{GClist(19)}(1:end-4),FileName{GClist(20)}(1:end-4),FileName{GClist(21)}(1:end-4),FileName{GClist(22)}(1:end-4)})
    set (gca,'ytick',[1:sf(1)],'YTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
                         FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
                         FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
                         FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4),...
                         FileName{GClist(19)}(1:end-4),FileName{GClist(20)}(1:end-4),FileName{GClist(21)}(1:end-4),FileName{GClist(22)}(1:end-4)})

    rotateXLabels(gca,90)
    caxis([cmin,cmax])
    colorbar('YTick',[0,-cmi,cmax-cmin],'YTickLabel',{cmi,0,cma})
    set(gca,'Position',[0,.07,.9,.91])
else
   
    figure
    h=bar3(F,barscale)
    for k = 1:length(h)
        zdata = get(h(k),'ZData');
        set(h(k),'CData',zdata...
                  ,'FaceColor','interp')
    end


    xlabel('from')
    ylabel('to')
    zlabel('F')
    view([0,90])
    set (gca,'xtick',[1:sf(1)],'XTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
                         FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
                         FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
                         FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4),...
                         FileName{GClist(19)}(1:end-4),FileName{GClist(20)}(1:end-4),FileName{GClist(21)}(1:end-4),FileName{GClist(22)}(1:end-4),FileName{GClist(23)}(1:end-4),FileName{GClist(24)}(1:end-4)})
    set (gca,'ytick',[1:sf(1)],'YTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
                         FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
                         FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
                         FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4),...
                         FileName{GClist(19)}(1:end-4),FileName{GClist(20)}(1:end-4),FileName{GClist(21)}(1:end-4),FileName{GClist(22)}(1:end-4),FileName{GClist(23)}(1:end-4),FileName{GClist(24)}(1:end-4)})

    rotateXLabels(gca,90)
    caxis([cmin,cmax])
    colorbar('YTick',[0,-cmi,cmax-cmin],'YTickLabel',{cmi,0,cma})
    set(gca,'Position',[0,.07,.9,.91])

end


% figure
% hold on
% [s1,s2]=size(Ff);
% for ii=1:s1
%   for jj=1:s2
%       
%       if isnan(Ff(ii,jj))
%           Ff(ii,jj)=0;
%       end
%       
%   end
% end
% col=sum(Ff);
% row=sum(Ff');
% bar(col*10,'g')
% barh(row*10,'b')
%  set (gca,'xtick',[1:22],'XTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
%                          FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
%                          FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
%                          FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4),...
%                          FileName{GClist(19)}(1:end-4),FileName{GClist(20)}(1:end-4),FileName{GClist(21)}(1:end-4),FileName{GClist(22)}(1:end-4)})
%     set (gca,'ytick',[1:22],'YTickLabel',{FileName{GClist(1)}(1:end-4),FileName{GClist(2)}(1:end-4),FileName{GClist(3)}(1:end-4),FileName{GClist(4)}(1:end-4),...
%                          FileName{GClist(5)}(1:end-4),FileName{GClist(6)}(1:end-4),FileName{GClist(7)}(1:end-4),FileName{GClist(8)}(1:end-4),...
%                          FileName{GClist(9)}(1:end-4),FileName{GClist(10)}(1:end-4),FileName{GClist(11)}(1:end-4),FileName{GClist(12)}(1:end-4),FileName{GClist(13)}(1:end-4),...
%                          FileName{GClist(14)}(1:end-4),FileName{GClist(15)}(1:end-4),FileName{GClist(16)}(1:end-4),FileName{GClist(17)}(1:end-4),FileName{GClist(18)}(1:end-4),...
%                          FileName{GClist(19)}(1:end-4),FileName{GClist(20)}(1:end-4),FileName{GClist(21)}(1:end-4),FileName{GClist(22)}(1:end-4)})

