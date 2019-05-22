function plot_digraph (A,B,alp,nameL,wid,lr,ts)     
figure
            hold on
            set(findall(gcf,'type','axes'),'fontsize',30)
          
            
             [h,p,c,s]=ttest2(A,B,'Dim',3,'alpha',alp,'tail','right');
              G = digraph(h.*(mean(A,3)-mean(B,3)),nameL,'OmitSelfLoops');
           plot(G,'Layout','circle','EdgeLabel', G.Edges.Weight,'LineWidth', (abs(G.Edges.Weight)+0.00001)*wid,...
                'EdgeColor','r','ArrowSize',10)
            %mi=h.*(mean(A,3)-mean(B,3));
           % view ([22.5,90])            
            [h,p,c,s]=ttest2(A,B,'Dim',3,'alpha',alp,'tail','left');
            G = digraph(h.*(mean(A,3)-mean(B,3)),nameL,'OmitSelfLoops');
            hold on
            plot(G,'Layout','circle','EdgeLabel', G.Edges.Weight,'LineWidth', (abs(G.Edges.Weight)+0.00001)*wid,...
                'EdgeColor','b','ArrowSize',15)
            title (num2str([lr,ts]))
            %h.*(mean(A,3)-mean(B,3))+mi