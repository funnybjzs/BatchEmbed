%PNG CROP��RESIZE TO JPEG
%Input :  Only PNG
%output : PNG or JPEG

function MakeSet(inputDir,outputDir,var)
%open log��δ��Ŀ¼�����������ȳ�������¼��log��
diary(var.log);
%process every dir
for d=1:length(inputDir)
    %get files
    var.inputImgext='png';  %��ǰֵ���PNGͼ�񣬲��ɸ���
    inputFiles=dir([inputDir{d} '\*.' var.inputImgext]);
    %print
    fprintf('---------------------------\n');
    fprintf('[��ʼʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('����Ŀ¼:  %s\n',inputDir{d});
    fprintf('��Ŀ¼�¹��� %d �� .png ͼ��\r\n',numel(inputFiles));
    %var detection, if dir is empty
    if(numel(inputFiles)==0)
        fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
        fprintf('---------------------------\r\n');
        break; %continue next dir process
    end      
    for i=1:numel(inputFiles)
        ProcessImage(inputDir,inputFiles,outputDir,var,d,i);
        fprintf('\n');
    end
    fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
    
end
%close log
diary off;
end
