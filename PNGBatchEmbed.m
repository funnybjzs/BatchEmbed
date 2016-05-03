function PNGBatchEmbed(inputDir,outputDir,var)
diary(var.log);
%����StegoĿ¼
for d=1:length(inputDir)
    fprintf('---------------------------\n');
    fprintf('[��ʼʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('����Ŀ¼:  %s\n',inputDir{d});
    files=dir([inputDir{d} '\*.png']);  %�ļ�
    fprintf('��Ŀ¼�¹��� %d �� png ͼ��\r\n',numel(files));
    if(~length(files)) %�ļ���Ϊ��
        fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
        fprintf('---------------------------\r\n');
        break;
    end       
    %������ϢĿ¼����д��Ŀ¼
    for e=1:length(var.embedFun)
        for p=1:length(var.payLoad)
            %��Ϊ������ͬһ��Ŀ¼�£����Զ�Ҳ������inputDirȷ������"png_size1_msg"
            %ouputDir��û��̫��Ĵ�������    
            msgDir{e,p}=[outputDir{d},'\msg\',var.embedFun{e},'_',int2str(var.payLoad(p)*1000)]; 
            stegoDir{e,p}=[inputDir{d}(1:length(inputDir{d})-8),var.embedFun{e},'_',int2str(var.payLoad(p)*1000)];
            mkdir(msgDir{e,p});
            mkdir(stegoDir{e,p});
        end
    end
    %����ÿһ��ͼ��
    for id=1:length(files)
            im=imfinfo([inputDir{d} '\' files(id).name]);
            infiles.File1=[inputDir{d} '\' files(id).name];
            infiles.IncDecKey=10000+id;
            infiles.PosKey=id;
            infiles.Img=imread(infiles.File1);%ֻ��Ҫ�������һ��ԴCOVERͼƬ
            fprintf('���ڴ���� %d ��ͼ�� :  %s\n',id,infiles.File1);
            fprintf('���� % d ����д������ :\n',length(var.embedFun)*length(var.payLoad));
            for e=1:length(var.embedFun)
                for p=1:length(var.payLoad)
                    fprintf('��Ƕ���㷨��%s --- Ƕ���� %f ��\n',var.embedFun{e},var.payLoad(p));
                    infiles.MsgFile=[msgDir{e,p} '\' files(id).name '.bin'];
                    msglength=floor(im.Width*im.Height*var.payLoad(p)/8);
                    GenMsg(id, msglength, infiles.MsgFile);
                    outfiles.File1=[stegoDir{e,p} '\' files(id).name];
                    feval(var.embedFun{e},infiles,outfiles);  %�����������
                    fprintf('���ɵ� %d ��ͼ�񡾳ɹ���: %s\n',outfiles.File1);
                end
            end
            fprintf('\n');
    end
    fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
end
diary off;
end