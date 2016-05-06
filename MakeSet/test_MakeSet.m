%PNG TO PNG PNG裁剪成对应尺寸
%qf设置为0，只读参数，勿修改
%inputDir、outputDir只能有一个
% inputDir={'C:\Users\zhaoshuo\Documents\test\png_4500x3000'};
% var.outputImgext='png';
% var.qf={0};
% var.size={[3000 2000],[1500 1000]}; 
% var.log='MakeSetLog.txt';
% outputDir={'C:\Users\zhaoshuo\Documents\test'};

%PNG TO JPEG
%inputDir、size数目必须对应一致，一般不建议有多个
%outputDir默认为一个，但如果多个时，则数目与inputDir、size对应一致
inputDir={'C:\Users\zhaoshuo\Documents\test\png_3000x2000\png_3000x2000_null_000','C:\Users\zhaoshuo\Documents\test\png_1500x1000\png_1500x1000_null_000'};
var.outputImgext='jpg';
var.qf={75,80,85,90,95};
var.size={[3000 2000],[1500 1000]}; 
var.log='MakeSetLog1.txt';
outputDir={'C:\Users\zhaoshuo\Documents\test'};

MakeSet(inputDir,outputDir,var);





