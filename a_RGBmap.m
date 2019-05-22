function a_RGBmap
cd /Users/fengqi/Documents/experiment/Data
nii=load_nii('_ave_cn_la.nii.gz');
R=nii.img;

nii=load_nii('_ave_tdcs_la_TP2.nii.gz');
tG=nii.img;

nii=load_nii('_ave_tdcs_la_TP3.nii.gz');
tB=nii.img;

tRGB=cat(4,R,tG,tB);
SliceBrowser(tRGB)



nii=load_nii('_ave_sham_la_TP2.nii.gz');
sG=nii.img;

nii=load_nii('_ave_sham_la_TP3.nii.gz');
sB=nii.img;

sRGB=cat(4,R,sG,sB);
SliceBrowser(sRGB)



Rb=single(R>2.0);
tGb=single(tG>2.0);
tBb=single(tB>2.0);
tRGBb=cat(4,Rb,tGb,tBb);
SliceBrowser(tRGBb)

sGb=single(sG>2.0);
sBb=single(sB>2.0);
sRGBb=cat(4,Rb,sGb,sBb);
SliceBrowser(sRGBb)

nii=make_nii(tRGB);
save_nii(nii,'_RGB_tdcs_la.nii.gz');
nii=make_nii(sRGB);
save_nii(nii,'_RGB_sham_la.nii.gz');
nii=make_nii(tRGBb);
save_nii(nii,'_RGB_bin20_tdcs_la.nii.gz');
nii=make_nii(sRGBb);
save_nii(nii,'_RGB_bin20_sham_la.nii.gz');

%right active 
nii=load_nii('_ave_cn_ra.nii.gz');
R=nii.img;

nii=load_nii('_ave_tdcs_ra_TP2.nii.gz');
tG=nii.img;

nii=load_nii('_ave_tdcs_ra_TP3.nii.gz');
tB=nii.img;

tRGB=cat(4,R,tG,tB);
SliceBrowser(tRGB)



nii=load_nii('_ave_sham_ra_TP2.nii.gz');
sG=nii.img;

nii=load_nii('_ave_sham_ra_TP3.nii.gz');
sB=nii.img;

sRGB=cat(4,R,sG,sB);
SliceBrowser(sRGB)



Rb=single(R>2.0);
tGb=single(tG>2.0);
tBb=single(tB>2.0);
tRGBb=cat(4,Rb,tGb,tBb);
SliceBrowser(tRGBb)

sGb=single(sG>2.0);
sBb=single(sB>2.0);
sRGBb=cat(4,Rb,sGb,sBb);
SliceBrowser(sRGBb)

nii=make_nii(tRGB);
save_nii(nii,'_RGB_tdcs_ra.nii.gz');
nii=make_nii(sRGB);
save_nii(nii,'_RGB_sham_ra.nii.gz');
nii=make_nii(tRGBb);
save_nii(nii,'_RGB_bin20_tdcs_ra.nii.gz');
nii=make_nii(sRGBb);
save_nii(nii,'_RGB_bin20_sham_ra.nii.gz');

cd /Users/fengqi/Documents/experiment