function a_generate_folderInfo
cd ~/Documents/experiment
load patientinfo.mat


for ii=1:71
    ii
    patientID{ii}
    cd /Volumes/Seagate' Backup Plus Drive'/   
    if strcmp( patientID{ii},'CN005')|strcmp( patientID{ii},'CN012')
    else
            cd(patientID{ii}) 
            l1=strsplit(ls);
            cd (l1{timepoint(ii)})
            cd reoriented_niis
            l2=strsplit(ls);
            s2=size(l2);

            curr_lrap=strsplit(lrap{ii});


            for jj=1:s2(2)
                k1=findstr(l2{jj},'.feat'); 

                if isempty(k1)
                else
                    ps=findstr(l2{jj},'bold_');
                    kk=str2num(l2{jj}(ps+5));


                    if strcmp(lesionside{ii},'RS')
                           if strcmp(curr_lrap(kk), 'Ra')
                                        addr{ii,1}=strcat(pwd,'/',l2{jj});
                            elseif strcmp(curr_lrap(kk), 'La')
                                         addr{ii,2}=strcat(pwd,'/',l2{jj});
                            elseif strcmp(curr_lrap(kk), 'Rp')
                                        addr{ii,3}=strcat(pwd,'/',l2{jj});
                            elseif strcmp(curr_lrap(kk), 'Lp')
                                        addr{ii,4}=strcat(pwd,'/',l2{jj});
                            else
                                       disp('wrong switch of lrap')
                            end 
                    else
                            if strcmp(curr_lrap(kk), 'La')
                                        addr{ii,1}=strcat(pwd,'/',l2{jj});
                            elseif strcmp(curr_lrap(kk), 'Ra')
                                         addr{ii,2}=strcat(pwd,'/',l2{jj});
                            elseif strcmp(curr_lrap(kk), 'Lp')
                                        addr{ii,3}=strcat(pwd,'/',l2{jj});
                            elseif strcmp(curr_lrap(kk), 'Rp')
                                        addr{ii,4}=strcat(pwd,'/',l2{jj});
                            else
                                       disp('wrong switch of lrap')
                            end
                    end


                end
            end
    end
    
end
a=1;