function GenPCode(dirPath)
%GENPCODE Summary of this function goes here
%   Detailed explanation goes here
delete([dirPath '/*.p']);
files=direx(dirPath,'/a-d-h/b');
for i=1:length(files)
    if (strcmp(files{i},'GenPCode.m') || strcmp(files{i}(end-1:end),'.m')~=1)
        continue;
    end
    pcode([dirPath '/' files{i}],'-INPLACE');
end
dirs=direx(dirPath,'/ad-h/b');
for i=1:length(dirs)
    Common.GenPCode([dirPath '/' dirs{i}])
end
end