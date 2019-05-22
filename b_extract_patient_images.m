function b_extract_patient_images

load patientinfo

for ii=1:71
   ii
   if isempty(addr{ii,1}) 
   else
      copyfile(strcat(addr{ii,1},'/thresh_zstat1.nii.gz'),strcat(patientID{ii},...
       'TP',num2str(timepoint(ii)),'_La.nii.gz'))       
      copyfile(strcat(addr{ii,2},'/thresh_zstat1.nii.gz'),strcat(patientID{ii},...
       'TP',num2str(timepoint(ii)),'_Ra.nii.gz')) 
      copyfile(strcat(addr{ii,3},'/thresh_zstat1.nii.gz'),strcat(patientID{ii},...
       'TP',num2str(timepoint(ii)),'_Lp.nii.gz')) 
      copyfile(strcat(addr{ii,4},'/thresh_zstat1.nii.gz'),strcat(patientID{ii},...
       'TP',num2str(timepoint(ii)),'_Rp.nii.gz')) 
   end
    
end

