%PNG TO PNG PNG�ü��ɶ�Ӧ�ߴ�
%qf����Ϊ0��ֻ�����������޸�
%inputDir��outputDirֻ����һ��
% inputDir={'C:\Users\zhaoshuo\Documents\test\png_4500x3000'};
% var.outputImgext='png';
% var.qf={0};
% var.size={[3000 2000],[1500 1000]}; 
% var.log='MakeSetLog.txt';
% outputDir={'C:\Users\zhaoshuo\Documents\test'};

%PNG TO JPEG
%inputDir��size��Ŀ�����Ӧһ�£�һ�㲻�����ж��
%outputDirĬ��Ϊһ������������ʱ������Ŀ��inputDir��size��Ӧһ��
inputDir={'C:\Users\zhaoshuo\Documents\test\png_3000x2000\png_3000x2000_null_000','C:\Users\zhaoshuo\Documents\test\png_1500x1000\png_1500x1000_null_000'};
var.outputImgext='jpg';
var.qf={75,80,85,90,95};
var.size={[3000 2000],[1500 1000]}; 
var.log='MakeSetLog1.txt';
outputDir={'C:\Users\zhaoshuo\Documents\test'};

MakeSet(inputDir,outputDir,var);





