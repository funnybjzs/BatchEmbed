%PNG转成PPM，作为JSteg的输入
function png2ppm(pngdir,ppmdir)
files=dir([pngdir '\*.png']);  %文件
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