function para= imgstatistic1(Is,mask)

scal=0.9;

iiinter=5;
jjinter=5;
kkinter=5;

iiinit=1;
jjinit=1;
kkinit=1;
  
  
locationopen=0;

        
 
para.black=0;
para.red=0;
para.green=0;
para.yellow=0;
para.blue=0;
para.lightblue=0;
para.purple=0;
para.white=0;

for ii=iiinit:iiinter:182 
              
    for jj=jjinit:jjinter:218
        for kk=kkinit:kkinter:182   
            
           r = Is(ii,jj,kk,1);
           g = Is(ii,jj,kk,2);
           b = Is(ii,jj,kk,3);
           
            if mask(ii,jj,kk)~=0 
                
                
              
                if r>0 && g==0 && b==0
                    para.red=para.red+1;
                elseif r==0 && g>0 && b==0
                    para.green=para.green+1;
                elseif r==0 && g==0 && b>0
                    para.blue=para.blue+1;
                elseif r>0 && g>0 && b==0
                    para.yellow=para.yellow+1;
                elseif r>0 && g==0 && b>0
                     para.purple=para.purple+1;
                elseif r==0 && g>0 && b>0
                     para.lightblue=para.lightblue+1;
                elseif r>0 && g>0 && b>0
                     para.white=para.white+1;
                else 
                    para.black=para.black+1;
                end
                
            end
            
       
        end
    end    
end

                       
para.total=para.red+para.blue+para.green+para.white+para.black+para.yellow+para.purple+para.lightblue;

