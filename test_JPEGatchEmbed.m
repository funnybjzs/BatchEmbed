%JPEG EMBED SCRIPT
%inputDir、va.qf、var.pngdir数目需要对应，最好保持默认的一个
%名称按照规则，必须体现cover的质量因子，因为嵌入工具会用到作为处理参数
%JSteg算法需要使用var.pngdir
inputDir={'Z:\jpg_80_1500x1000\jpg_80_1500x1000_null_000'};
var.qf=[80];
var.embedFun={'F5'};
var.payLoad=[0.2];
var.password='sklois27';
var.exe=[pwd '\EmbedTools'];
var.log='jpg_80_1500x1000_f5_200.log';
var.pngdir={'Z:\png_1500x1000'};
outputDir={'Z:\jpg_80_1500x1000'};
JPEGBatchEmbed(inputDir,outputDir,var);


