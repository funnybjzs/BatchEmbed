%PNG CROP、RESIZE TO JPEG
%Input :  Only PNG
%output : PNG or JPEG

function MakeSet(inputDir,outputDir,var)
%open log，未对目录存在性做检查等出错处理，记录到log中
diary(var.log);
%process every dir
for d=1:length(inputDir)
    %get files
    var.inputImgext='png';  %当前值针对PNG图像，不可更改
    inputFiles=dir([inputDir{d} '\*.' var.inputImgext]);
    %print
    fprintf('---------------------------\n');
    fprintf('[开始时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('进入目录:  %s\n',inputDir{d});
    fprintf('该目录下共有 %d 张 .png 图像\r\n',numel(inputFiles));
    %var detection, if dir is empty
    if(numel(inputFiles)==0)
        fprintf('[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
        fprintf('---------------------------\r\n');
        break; %continue next dir process
    end      
    for i=1:numel(inputFiles)
        ProcessImage(inputDir,inputFiles,outputDir,var,d,i);
        fprintf('\n');
    end
    fprintf('[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
    
end
%close log
diary off;
end
