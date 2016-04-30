function ProcessImage(inputDir,files,outputDir,var,d,i)
%��ǰ��������ļ�
srcFile=fullfile(inputDir{d},'\',files(i).name);
%��ӡ
fprintf('���ڴ���� %d ��ͼƬ %s\n',i,srcFile);
%��ȡ
srcImg=imread(srcFile);
[height,width,channels]=size(srcImg);
%�����PNG TO PNG
fprintf('��ǰͼ��ߴ磺��%d,%d��\n',height, width);
if(var.output_imgext=='png')
    fprintf('Ŀ��ͼ������%s���� %d �ֳߴ紦�����\n',var.output_imgext,numel(var.size));
    for sz=1:numel(var.size)
        dirName=[var.output_imgext,'_',int2str(var.size{sz}(1)),'x',int2str(var.size{sz}(2))];
        if(~exist([outputDir{d},'\',dirName],'dir'))
            mkdir([outputDir{d},'\',dirName]); %������ӦsizeĿ¼
        end
        dstFile=fullfile(outputDir{d},'\',dirName,'\',files(i).name);
        %rezie����Ӧ�ĳߴ�
        if((height/width)>=1&&(var.size{sz}(1)/var.size{sz}(2))>=1)
            dstImg=imresize(srcImg,[var.size{sz}(1),var.size{sz}(2)]);
            fprintf('Ŀ�괦����� %d���ߴ�---��%d,%d��\n', sz,var.size{sz}(1),var.size{sz}(2));
        else
            dstImg=imresize(srcImg,[var.size{d}(2),var.size{d}(1)]);
            fprintf('Ŀ�괦����� %d���ߴ�---��%d,%d��\n', sz,var.size{sz}(2),var.size{sz}(1));
        end
        imwrite(dstImg,dstFile);
        fprintf('���ɵ� %d ��ͼ�� %s���ɹ���\n',i,dstFile);
    end
elseif(var.output_imgext=='jpg')
%�����PNG TO JPEG
    fprintf('Ŀ��ͼ������%s���� %d ���������Ӵ������\n',var.output_imgext,numel(var.qf));
    if(numel(outputDir)>1)
        outputDir_=outputDir{d}; 
    else%˵�������Ŀ¼ֻ��1����������������ڴ�Ŀ¼��
        outputDir_=outputDir{1};
    end
    for q=1:numel(var.qf);
        dirName=[var.output_imgext,'_',int2str(var.qf{q}),'_',int2str(var.size{d}(1)),'x',int2str(var.size{d}(2))];
        if(~exist([outputDir_,'\',dirName],'dir'))          
            mkdir([outputDir_,'\',dirName]); %������ӦĿ¼
        end
        dstFile=fullfile(outputDir_,'\',dirName,'\',strcat(files(i).name(1:length(files(i).name)-4),'.jpg'));
        fprintf('Ŀ�괦����� %d����������---��%d��\n', q,var.qf{q});
        imwrite(srcImg,dstFile,'jpg','quality',var.qf{q});
        fprintf('���ɵ� %d ��ͼ�� %s���ɹ���\n',i,dstFile);
    end
else
    fprintf('ͼ���ʽδ֪�������ɵڡ�%d����ͼ�� %s��ʧ�ܡ�\r\n',i,dstFile);
end
end