function fslqf(cmd)

setenv('FSLDIR','/usr/local/fsl');  % this to tell where FSL folder is
setenv('FSLOUTPUTTYPE', 'NIFTI_GZ'); % this to tell what the output type 
cmd=strcat('/usr/local/fsl/bin/',cmd);
system(cmd);