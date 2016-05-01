%PNG TO PNG PNG裁剪成对应尺寸
%qf设置为0，只读参数，勿修改
%inputDir、outputDir只能有一个
% inputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\PNG_BIG'};
% var.outputImgext='png';
% var.qf={0};
% var.size={[1500 1000]}; 
% var.log='MakeSetLog.txt';
% outputDir={'C:\Users\zhaoshuo\Documents\PNGRAW'};

%PNG TO JPEG
%inputDir、size数目必须对应一致，一般不建议有多个
%outputDir默认为一个，但如果多个时，则数目与inputDir、size对应一致
inputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\png_1500x1000'};
var.outputImgext='jpg';
var.qf={75,80};
var.size={[1500 1000]}; 
var.log='MakeSetLog1.txt';
outputDir={'C:\Users\zhaoshuo\Documents\PNGRAW'};

MakeSet(inputDir,outputDir,var);





