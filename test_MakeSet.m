%PNG TO PNG PNG裁剪成对应尺寸
%qf设置为0，只读参数，勿修改
%inputDir、outputDir只能有一个
% inputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\PNG_BIG'};
% var.output_imgext='png';
% var.qf={0};
% var.size={[3000 2000],[1500 1000]}; 
% var.log='MakeSetLog.txt';
% outputDir={'C:\Users\zhaoshuo\Documents\PNGRAW'};

%PNG TO JPEG
%inputDir、size数目必须对应一致，一般不建议有多个
inputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\png_3000x2000','C:\Users\zhaoshuo\Documents\PNGRAW\png_1500x1000'};
var.output_imgext='jpg';
var.qf={75,80};
var.size={[3000 2000],[1500 1000]}; 
var.log='MakeSetLog1.txt';
outputDir={'C:\Users\zhaoshuo\Documents\PNGRAW'};

MakeSet(inputDir,outputDir,var);





