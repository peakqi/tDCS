function d_RGB_GC(F,maskname,seqindex,maxF)

clim_F=[-maxF,maxF];

figure
imagesc(F,clim_F);
colormap hot
ax=gca;
ax.XTick=(1:42);
ax.XTickLabel={maskname{seqindex(1:42)}};
ax.XTickLabelRotation=90;
ax.YTick=(1:42);
ax.YTickLabel={maskname{seqindex(1:42)}};
%title(strcat(titlename,'-F'));
colorbar
xlabel('from')
ylabel('to')
colormap jet
