function a=qf_load(filename)

img=load_nii(filename);
a=single(img.img);