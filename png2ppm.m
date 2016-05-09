%PNGת��PPM����ΪJSteg������
function png2ppm(pngdir,ppmdir)
files=dir([pngdir '\*.png']);  %�ļ�
if(~exist(ppmdir,'dir'))
    mkdir(ppmdir);
end
for i=1:length(files)
    [pathstr,name,ext] = fileparts(files(i).name);
    ppm=fullfile(ppmdir,[name '.ppm']);
    img=imread(fullfile(pngdir,files(i).name));
    imwrite(img,ppm);
end
end