function ProcessImage(inputDir,files,outputDir,var,d,i)
%当前待处理的文件
srcFile=fullfile(inputDir{d},'\',files(i).name);
%打印
fprintf('正在处理第 %d 张图片 %s\n',i,srcFile);
%读取
srcImg=imread(srcFile);
[height,width,channels]=size(srcImg);
%确定是否是多个输出目录
if(numel(outputDir)>1)
    outputDir_=outputDir{d}; 
else%说明是输出目录只有1个，所有输出都放在此目录下
    outputDir_=outputDir{1};
end
fprintf('当前图像尺寸：【%d,%d】\n',height, width);
%如果是PNG TO PNG
if(var.outputImgext=='png')
    fprintf('目标图像类型%s，共 %d 种尺寸处理参数\n',var.outputImgext,numel(var.size));
    for sz=1:numel(var.size)
        %创建对应size目录
        dirName=[var.outputImgext,'_',int2str(var.size{sz}(1)),'x',int2str(var.size{sz}(2))];
        if(~exist([outputDir_,'\',dirName],'dir'))
            mkdir([outputDir_,'\',dirName]); 
        end
        dstFile=fullfile([outputDir_,'\',dirName],files(i).name);
        %rezie至对应的尺寸
        if((height/width)>=1&&(var.size{sz}(1)/var.size{sz}(2))>=1)
            dstImg=imresize(srcImg,[var.size{sz}(1),var.size{sz}(2)]);
            fprintf('目标处理参数 %d：尺寸---【%d,%d】\n', sz,var.size{sz}(1),var.size{sz}(2));
        else
            dstImg=imresize(srcImg,[var.size{d}(2),var.size{d}(1)]);
            fprintf('目标处理参数 %d：尺寸---【%d,%d】\n', sz,var.size{sz}(2),var.size{sz}(1));
        end
        imwrite(dstImg,dstFile);
        fprintf('生成第 %d 张图像 %s【成功】\n',i,dstFile);
    end
elseif(var.outputImgext=='jpg')
%如果是PNG TO JPEG
    fprintf('目标图像类型%s，共 %d 种质量因子处理参数\n',var.outputImgext,numel(var.qf));
    for q=1:numel(var.qf);
        dirName=[var.outputImgext,'_',int2str(var.qf{q}),'_',int2str(var.size{d}(1)),'x',int2str(var.size{d}(2))];
        if(~exist([outputDir_,'\',dirName,'\',dirName,'_null_000'],'dir'))          
            mkdir([outputDir_,'\',dirName,'\',dirName,'_null_000']); %创建对应目录
        end
        dstFile=fullfile([outputDir_,'\',dirName,'\',dirName,'_null_000'],strcat(files(i).name(1:length(files(i).name)-4),'.jpg'));
        fprintf('目标处理参数 %d：质量因子---【%d】\n', q,var.qf{q});
        imwrite(srcImg,dstFile,'jpg','quality',var.qf{q});
        fprintf('生成第 %d 张图像 %s【成功】\n',i,dstFile);
    end
else
    fprintf('图像格式未知错误，生成第【%d】张图像 %s【失败】\r\n',i,dstFile);
end
end