function ProcessImage(inputDir,files,outputDir,var,d,i)
srcFile=fullfile(inputDir{d},'\',files(i).name);
dstFile=fullfile(outputDir{d},'\',files(i).name);
%��ӡ
fprintf('���ڴ���ڡ�%d����ͼƬ %s\n',i,srcFile);
srcImg=imread(srcFile);
[height,width,channels]=size(srcImg);
%rezie����Ӧ�ĳߴ�
if((height/width)>=1&&(var.size{d}(1)/var.size{d}(2))>=1)
    dstImg=imresize(srcImg,[var.size{d}(1),var.size{d}(2)]);
    fprintf('����������ߴ�---��%d,%d������������---��%d��\n',var.size{d}(1),var.size{d}(2),var.qf{d});
else
    dstImg=imresize(srcImg,[var.size{d}(2),var.size{d}(1)]);
    fprintf('����������ߴ�---��%d,%d������������---��%d��\n',var.size{d}(2),var.size{d}(1),var.qf{d});
end
if(var.output_imgext=='png')
    imwrite(dstImg,dstFile);
    fprintf('���ɵڡ�%d����ͼ�� %s���ɹ���\r\n',i,dstFile);
elseif(var.output_imgext=='jpg')
    dstFile=strcat(dstFile(1:length(dstFile)-4),'.jpg');
    imwrite(dstImge,dstFile,'jpg','quality',var.qf{d});
    fprintf('���ɵڡ�%d����ͼ�� %s���ɹ���\r\n',i,dstFile);
else
    fprintf('ͼ���ʽδ֪�������ɵڡ�%d����ͼ�� %s��ʧ�ܡ�\r\n',i,dstFile);
end
end