%PNG TO PNG PNG�ü��ɶ�Ӧ�ߴ�
%qf����Ϊ0��ֻ�����������޸�
%inputDir��outputDirֻ����һ��
% inputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\PNG_BIG'};
% var.outputImgext='png';
% var.qf={0};
% var.size={[1500 1000]}; 
% var.log='MakeSetLog.txt';
% outputDir={'C:\Users\zhaoshuo\Documents\PNGRAW'};

%PNG TO JPEG
%inputDir��size��Ŀ�����Ӧһ�£�һ�㲻�����ж��
%outputDirĬ��Ϊһ������������ʱ������Ŀ��inputDir��size��Ӧһ��
inputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\png_1500x1000'};
var.outputImgext='jpg';
var.qf={75,80};
var.size={[1500 1000]}; 
var.log='MakeSetLog1.txt';
outputDir={'C:\Users\zhaoshuo\Documents\PNGRAW'};

MakeSet(inputDir,outputDir,var);





