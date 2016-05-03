function PNGBatchEmbed(inputDir,outputDir,var)
diary(var.log);
%创造Stego目录
for d=1:length(inputDir)
    fprintf('---------------------------\n');
    fprintf('[开始时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('进入目录:  %s\n',inputDir{d});
    files=dir([inputDir{d} '\*.png']);  %文件
    fprintf('该目录下共有 %d 张 png 图像\r\n',numel(files));
    if(~length(files)) %文件夹为空
        fprintf('[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
        fprintf('---------------------------\r\n');
        break;
    end       
    %创造消息目录、隐写集目录
    for e=1:length(var.embedFun)
        for p=1:length(var.payLoad)
            %因为都放在同一个目录下，所以都也可以由inputDir确定，如"png_size1_msg"
            %ouputDir就没有太大的存在意义    
            msgDir{e,p}=[outputDir{d},'\msg\',var.embedFun{e},'_',int2str(var.payLoad(p)*1000)]; 
            stegoDir{e,p}=[inputDir{d}(1:length(inputDir{d})-8),var.embedFun{e},'_',int2str(var.payLoad(p)*1000)];
            mkdir(msgDir{e,p});
            mkdir(stegoDir{e,p});
        end
    end
    %处理每一张图像
    for id=1:length(files)
            im=imfinfo([inputDir{d} '\' files(id).name]);
            infiles.File1=[inputDir{d} '\' files(id).name];
            infiles.IncDecKey=10000+id;
            infiles.PosKey=id;
            infiles.Img=imread(infiles.File1);%只需要在最面读一次源COVER图片
            fprintf('正在处理第 %d 张图像 :  %s\n',id,infiles.File1);
            fprintf('共有 % d 种隐写集参数 :\n',length(var.embedFun)*length(var.payLoad));
            for e=1:length(var.embedFun)
                for p=1:length(var.payLoad)
                    fprintf('【嵌入算法：%s --- 嵌入率 %f 】\n',var.embedFun{e},var.payLoad(p));
                    infiles.MsgFile=[msgDir{e,p} '\' files(id).name '.bin'];
                    msglength=floor(im.Width*im.Height*var.payLoad(p)/8);
                    GenMsg(id, msglength, infiles.MsgFile);
                    outfiles.File1=[stegoDir{e,p} '\' files(id).name];
                    feval(var.embedFun{e},infiles,outfiles);  %函数句柄调用
                    fprintf('生成第 %d 张图像【成功】: %s\n',outfiles.File1);
                end
            end
            fprintf('\n');
    end
    fprintf('[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
end
diary off;
end