%JPEG EMBED SCRIPT
%inputDir、va.qf、var.pngdir数目需要对应，最好保持默认的一个
%名称按照规则，必须体现cover的质量因子，因为嵌入工具会用到作为处理参数
%JSteg算法需要使用var.pngdir
inputDir={'C:\Users\zhaoshuo\Documents\test\jpg_75_1500x1000\jpg_75_1500x1000_null_000'};
var.qf=[75];
var.embedFun={'F5','JSteg','NSF5','JLSBM','MME'};
var.payLoad=[0.2,0.3,0.4];
var.password='sklois27';
var.exe=[pwd '\EmbedTools'];
var.log='JPEG_STEGOMAKE.log';
var.pngdir={'C:\Users\zhaoshuo\Documents\test\png_1500x1000\png_1500x1000_null_000'};
outputDir={'C:\Users\zhaoshuo\Documents\test\jpg_75_1500x1000'};
JPEGBatchEmbed(inputDir,outputDir,var);


