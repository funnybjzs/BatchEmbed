function ProcessImage(inputDir,files,outputDir,var,d,i)
srcFile=fullfile(inputDir{d},'\',files(i).name);
dstFile=fullfile(outputDir{d},'\',files(i).name);
%打印
fprintf('正在处理第【%d】张图片 %s\n',i,srcFile);
srcImg=imread(srcFile);
[height,width,channels]=size(srcImg);
%rezie至对应的尺寸
if((height/width)>=1&&(var.size{d}(1)/var.size{d}(2))>=1)
    dstImg=imresize(srcImg,[var.size{d}(1),var.size{d}(2)]);
    fprintf('处理参数：尺寸---【%d,%d】，质量因子---【%d】\n',var.size{d}(1),var.size{d}(2),var.qf{d});
else
    dstImg=imresize(srcImg,[var.size{d}(2),var.size{d}(1)]);
    fprintf('处理参数：尺寸---【%d,%d】，质量因子---【%d】\n',var.size{d}(2),var.size{d}(1),var.qf{d});
end
if(var.output_imgext=='png')
    imwrite(dstImg,dstFile);
    fprintf('生成第【%d】张图像 %s【成功】\r\n',i,dstFile);
elseif(var.output_imgext=='jpg')
    dstFile=strcat(dstFile(1:length(dstFile)-4),'.jpg');
    imwrite(dstImge,dstFile,'jpg','quality',var.qf{d});
    fprintf('生成第【%d】张图像 %s【成功】\r\n',i,dstFile);
else
    fprintf('图像格式未知错误，生成第【%d】张图像 %s【失败】\r\n',i,dstFile);
end
end