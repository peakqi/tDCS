function imgshow1(Is,mask)

scal=0.9

iiinter=5;
jjinter=5;
kkinter=5;

iiinit=1;
jjinit=1;
kkinit=1;
  
  
locationopen=0;

        


  
figure
hold on
grid
xlim([0,1])
ylim([0,1])
zlim([0,1])
xlabel('r')
ylabel('g')
zlabel('b')
view([73,38])
title ('rgb space')  


for ii=iiinit:iiinter:182 
            
    for jj=jjinit:jjinter:218
        for kk=kkinit:kkinter:182   
            
                  
            if mask(ii,jj,kk)~=0 
                
                   r = Is(ii,jj,kk,1);
                   g = Is(ii,jj,kk,2);
                   b = Is(ii,jj,kk,3);
                if r==0 || g==0 || b==0      
                   scatter3(Is(ii,jj,kk,1),Is(ii,jj,kk,2),Is(ii,jj,kk,3),75,...
                        [Is(ii,jj,kk,1),Is(ii,jj,kk,2),Is(ii,jj,kk,3)])                
                else
                    scatter3(Is(ii,jj,kk,1),Is(ii,jj,kk,2),Is(ii,jj,kk,3),75,...
                    [Is(ii,jj,kk,1),Is(ii,jj,kk,2),Is(ii,jj,kk,3)],'fill')
                end
                
            
            end
            
       
        end
    end    
end

t=0:100;
scatter3(t/100,t/100,t/100,5,[0,0,0],'fill')
axis([0,.7,0,.7,0,.7])                   




if locationopen==1
        figure
        hold on
        grid
        xlim([0,1])
        ylim([0,1])
        zlim([0,1])
        xlabel('x')
        ylabel('y')
        zlabel('z')
        view([73,38])
          title ('+position')
        for ii=iiinit:iiinter:182 
            ii          
            for jj=jjinit:jjinter:218
                for kk=kkinit:kkinter:182           
                    if mask(ii,jj,kk) ~=0 
                        scatter3(ii/182,jj/218,kk/182,75,...        
                                    [Is(ii,jj,kk,1),Is(ii,jj,kk,2),Is(ii,jj,kk,3)],'fill')
                    end

                end
            end    
        end
        t=0:100;
        scatter3(t/100,t/100,t/100,5,...
                                    [0,0,0],'fill')
end