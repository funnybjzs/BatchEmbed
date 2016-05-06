function JPEGBatchEmbed(inputDir,outputDir,var);
diary(var.log);
%����StegoĿ¼
for d=1:length(inputDir)
    fprintf('---------------------------\n');
    fprintf('[��ʼʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('����Ŀ¼:  %s\n',inputDir{d});
    files=dir([inputDir{d} '\*.jpg']);  %�ļ�
    fprintf('��Ŀ¼�¹��� %d �� jpg ͼ��\r\n',length(files));
    if(~length(files)) %�ļ���Ϊ��
        fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
        fprintf('---------------------------\r\n');
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
    %����Jstego����PPM�ļ����ж�Ӧ�ߴ��PNGͼ�����ɣ�
    jstegPPMDir=[outputDir{d},'\msg\JStegPPM'];
    mkdir(jstegPPMDir);
    %����ÿһ��ͼ��
    for id=1:length(files)
            cover=[inputDir{d} '\' files(id).name];
            fprintf('���ڴ���� %d ��ͼ�� :  %s\n',id,cover);
            fprintf('�� % d ��Ŀ�괦����� :\n',length(var.embedFun)*length(var.payLoad));
            cover_ppm=JStegPPM(cover,var,d,jstegPPMDir);
            for e=1:length(var.embedFun)
                for p=1:length(var.payLoad)
                    fprintf('��Ƕ���㷨��%s ---Ƕ���� %f��\n',var.embedFun{e},var.payLoad(p));
                    stego=[stegoDir{e,p},'\',files(id).name];
                    if (strcmp(var.embedFun{e},'JSteg'))
                        JSteg(id,d,cover,stego,msgDir{e,p},var.payLoad(p),var,cover_ppm);
                    else %�����㷨
                        feval(var.embedFun{e},id,d,cover,stego,msgDir{e,p},var.payLoad(p),var);                       
                 	 end
                end
            end
            fprintf('\n');
    end
    fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
end
diary off;
end