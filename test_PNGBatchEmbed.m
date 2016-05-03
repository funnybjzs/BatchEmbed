%PNG EMBED SCRIPT
%coverDir、StegoDir数目需要对应，最好保持默认的一个
inputDir={'C:\Users\zhaoshuo\Documents\test\png_3000x2000\png_3000x2000_null_000'};
var.embedFun={'LSBR','LSBM'};
var.payLoad=[0.2,0.3,0.4];
var.log='PNG_STEGOMAKE.log';
outputDir={'C:\Users\zhaoshuo\Documents\test\png_3000x2000'};
PNGBatchEmbed(inputDir,outputDir,var);



