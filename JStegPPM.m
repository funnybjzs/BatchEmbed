function cover_ppmm=JStegPPM(cover,var,d,ppm_dir)
[fpath,fname,fext]=fileparts(cover);
img=imread(fullfile(var.pngdir{d},[fname '.png']));
cover_ppmm=fullfile(ppm_dir,[fname '.ppm']);
imwrite(img,cover_ppmm);
end