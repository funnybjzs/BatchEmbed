%PNG TO PNG
inputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\PNG_BIG','C:\Users\zhaoshuo\Documents\PNGRAW\PNG_BIG'};
var.output_imgext='png';
var.qf={0,0};
var.size={[3000 2000],[512 512]}; 
var.log='MakeSetLog.txt';
outputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\png_mid','C:\Users\zhaoshuo\Documents\PNGRAW\png_sml'};

%PNG TO JPEG
% inputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\PNG_BIG','C:\Users\zhaoshuo\Documents\PNGRAW\PNG_MID'};
% var.output_imgext='jpg';
% var.qf={75};
% var.size={'raw','3000*2000'}; 
% var.log='MakeSetLog.txt';
% outputDir={'C:\Users\zhaoshuo\Documents\PNGRAW\out_big','C:\Users\zhaoshuo\Documents\PNGRAW\out_sml'};

MakeSet(inputDir,outputDir,var);





