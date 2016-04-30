%PNG CROP、RESIZE TO JPEG
%Input :  Only PNG
%output : PNG or JPEG

function MakeSet(inputDir,outputDir,var)
%open log
diary(var.log);
%var detection
if(length(unique([length(inputDir),length(outputDir),length(var.qf),length(var.size)]))~=1)
    fprintf('错误，参数数目不一致\n');
end
%process every dir
for d=1:length(inputDir)
    %dir exist
    if(~exist(inputDir{d},'dir'))
        fprintf('输入文件目录不存在 [%s] \n',inputDir{d});
        break;
    end
    %get files
    var.input_imgext='png';  %当前值针对PNG图像，不可更改
    inputFiles=dir([inputDir{d} '\*.' var.input_imgext]);
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
    
    if(~exist(outputDir{d},'dir'))
        mkdir(outputDir{d});
    end
    
    for i=1:numel(inputFiles)
        ProcessImage(inputDir,inputFiles,outputDir,var,d,i);
    end
    fprintf('[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
    
end
%close log
diary off;
end
