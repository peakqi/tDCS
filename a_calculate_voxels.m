function RGBstatics =a_calculate_voxels(R,G,B,MASK)

R=R.*MASK;
G=G.*MASK;
B=B.*MASK;

mask0=R*0;
mask1=R*0+1;

BB=single(R==mask1 & G==mask0 & B==mask0);
Rn=sum(sum(sum(BB)));

BB=single(R==mask0 & G==mask1 & B==mask0);
Gn=sum(sum(sum(BB)));

BB=single(R==mask1 & G==mask1 & B==mask0);
Yn=sum(sum(sum(BB)));


BB=single(R==mask0 & G==mask0 & B==mask1);
Bn=sum(sum(sum(BB)));

BB=single(R==mask1 & G==mask0 & B==mask1);
Pn=sum(sum(sum(BB)));

BB=single(R==mask0 & G==mask1 & B==mask1);
Cn=sum(sum(sum(BB)));

BB=single(R==mask1 & G==mask1 & B==mask1);
Wn=sum(sum(sum(BB)));

RGBstatics=[sum(sum(sum(MASK)))-Rn-Gn-Yn-Bn-Pn-Cn-Wn,Rn,Gn,Yn,Bn,Pn,Cn,Wn]