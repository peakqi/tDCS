function qf_fliphorizontal(filename)
img=load_nii(filename);
a=img.img;
save_nii(img,strcat('orig_',filename))
b=flip(a,1);
SliceBrowser(a)
SliceBrowser(b)
img=make_nii(b);
save_nii(img,filename)

