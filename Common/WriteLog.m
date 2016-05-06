function WriteLog(resFilePtr,fileName,message)
%WRITELOG Summary of this function goes here
%   Detailed explanation goes here
fprintf(resFilePtr,'\t\t<error>\n');
fprintf(resFilePtr,'\t\t\t<errorTime>%s</errorTime>\n',datestr(now,'yyyy-mm-dd HH:MM:ss'));
fprintf(resFilePtr,'\t\t\t<fileName>%s</fileName>\n',fileName);
fprintf(resFilePtr,'\t\t\t<message><![CDATA[%s]]></message>\n',message);
fprintf(resFilePtr,'\t\t</error>\n');
end

