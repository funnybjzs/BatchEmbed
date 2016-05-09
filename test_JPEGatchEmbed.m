%JPEG EMBED SCRIPT
%inputDir、va.qf、var.pngdir数目需要对应，最好保持默认的一个
%qf作为处理图像集cover的质量因子需要对应，因为嵌入工具会用到作为处理参数
%JSteg算法需要使用var.ppmdir
% inputDir={'Z:\jpg_80_1500x1000\jpg_80_1500x1000_null_000'};
% var.qf=[80];
% var.embedFun={'F5'};
% var.payLoad=[0.2];
% var.password='sklois27';
% var.exe=[pwd '\EmbedTools'];
% var.log='jpg_80_1500x1000_f5_200.log';
% var.ppmdir={'Z:\ppm_1500x1000'};
% outputDir={'Z:\jpg_80_1500x1000'};
% JPEGBatchEmbed(inputDir,outputDir,var);

imgType='jpg_75_1500x1000';
path='D:\'
inputDir={[path imgType '\' imgType '_null_000']};
var.qf=[75];
var.embedFun={'F5'};
var.payLoad=[0.2];
var.password='sklois27';
var.exe=[pwd '\EmbedTools'];
var.log={[imgType,'_f5_200.log']};
var.ppmdir={'D:\ppm_1500x1000'};
outputDir={[path imgType]};
JPEGBatchEmbed(inputDir,outputDir,var);

imgType='jpg_80_1500x1000';
path='D:\'
inputDir={[path imgType '\' imgType '_null_000']};
var.qf=[80];
var.embedFun={'F5'};
var.payLoad=[0.2];
var.password='sklois27';
var.exe=[pwd '\EmbedTools'];
var.log={[imgType,'_f5_200.log']};
var.ppmdir={'D:\ppm_1500x1000'};
outputDir={[path imgType]};
JPEGBatchEmbed(inputDir,outputDir,var);


