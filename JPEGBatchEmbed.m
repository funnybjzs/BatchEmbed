function JPEGBatchEmbed(inputDir,outputDir,var)
for d=1:length(inputDir)
    diary(var.log{d});
    fprintf('---------------------------\n');
    fprintf('[��ʼʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('����Ŀ¼:  %s\n',inputDir{d});
    files=dir([inputDir{d} '\*.jpg']);  %�ļ�
    fprintf('��Ŀ¼�¹��� %d �� jpg ͼ��\r\n',length(files));
    if(isempty(files)) %�ļ���Ϊ��
        fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
        fprintf('---------------------------\r\n');
        diary off;
        continue;
    end       
    %������ϢĿ¼����д��Ŀ¼
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
            fprintf('���ڴ���� %d ��ͼ�� :  %s\n',id,cover);
            fprintf('�� % d ��Ŀ�괦����� :\n',length(var.embedFun)*length(var.payLoad));
            for e=1:length(var.embedFun)
                for p=1:length(var.payLoad)
                    fprintf('��Ƕ���㷨��%s ---Ƕ���� %f��\n',var.embedFun{e},var.payLoad(p));
                    stego=[stegoDir{e,p},'\',files(id).name];
                    feval(var.embedFun{e},id,d,cover,stego,msgDir{e,p},var.payLoad(p),var);                       
                end
            end
            fprintf('\n');
    end
    fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
    diary off;
end
end