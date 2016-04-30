%PNG CROP��RESIZE TO JPEG
%Input :  Only PNG
%output : PNG or JPEG

function MakeSet(inputDir,outputDir,var)
%open log
diary(var.log);
%var detection
if(length(unique([length(inputDir),length(outputDir),length(var.qf),length(var.size)]))~=1)
    fprintf('���󣬲�����Ŀ��һ��\n');
end
%process every dir
for d=1:length(inputDir)
    %dir exist
    if(~exist(inputDir{d},'dir'))
        fprintf('�����ļ�Ŀ¼������ [%s] \n',inputDir{d});
        break;
    end
    %get files
    var.input_imgext='png';  %��ǰֵ���PNGͼ�񣬲��ɸ���
    inputFiles=dir([inputDir{d} '\*.' var.input_imgext]);
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
    
    if(~exist(outputDir{d},'dir'))
        mkdir(outputDir{d});
    end
    
    for i=1:numel(inputFiles)
        ProcessImage(inputDir,inputFiles,outputDir,var,d,i);
    end
    fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\r\n');
    
end
%close log
diary off;
end
