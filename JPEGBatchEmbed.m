function JPEGBatchEmbed(inputDir,outputDir,var)
for d=1:length(inputDir)
    diary(var.log{d});
    fprintf('---------------------------\n');
    fprintf('[开始时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('进入目录:  %s\n',inputDir{d});
    files=dir([inputDir{d} '\*.jpg']);  %文件
    fprintf('该目录下共有 %d 张 jpg 图像\r\n',length(files));
    if(isempty(files)) %文件夹为空
        fprintf('[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
        fprintf('---------------------------\r\n');
        diary off;
        continue;
    end       
    %创造消息目录、隐写集目录
    for e=1:length(var.embedFun)
        for p=1:length(var.payLoad)
            msgDir{e,p}=[outputDir{d},'\msg\',var.embedFun{e},'_',int2str(var.payLoad(p)*1000)];
            stegoDir{e,p}=[inputDir{d}(1:length(inputDir{d})-8),var.embedFun{e},'_',int2str(var.payLoad(p)*1000)];
            mkdir(msgDir{e,p});
            mkdir(stegoDir{e,p});            
        end
    end
    
    for id=1:length(files)
            cover=[inputDir{d} '\' files(id).name];
            fprintf('正在处理第 %d 张图像 :  %s\n',id,cover);
            fprintf('共 % d 种目标处理参数 :\n',length(var.embedFun)*length(var.payLoad));
            for e=1:length(var.embedFun)
                for p=1:length(var.payLoad)
                    fprintf('【嵌入算法：%s ---嵌入率 %f】\n',var.embedFun{e},var.payLoad(p));
                    stego=[stegoDir{e,p},'\',files(id).name];
                    feval(var.embedFun{e},id,d,cover,stego,msgDir{e,p},var.payLoad(p),var);                       
                end
            end
            fprintf('\n');
    end
    fprintf('[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
    diary off;
end
end