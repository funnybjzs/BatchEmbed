function CleanPaths(paths, backupPath, resFilePtr, type)
if (~exist(backupPath,'dir'))
    mkdir(backupPath);
end
for i=1:length(paths)
    while (exist(paths{i}, type))
        if (resFilePtr==1)
            fprintf('Path ''%s'' already exists, back it up or you remove it manually? b/[r]',paths{i});
            R=input('','s');
            if isempty(R) || R=='R' || R=='r', continue; end
        end
%         offset=find(paths{i}=='\');
        pathName=strrep(strrep(strrep(paths{i},':',''),'..',''),'\','_');
        if (pathName(1)=='_'), pathName=pathName(2:end); end
        if (strcmp(type,'dir'))
            newPath=[backupPath '\' pathName];
            movefile(paths{i}, newPath, 'f');
            tempa=direx(newPath,'/b');
            if (isempty(tempa))
                rmdir(newPath);
            end
        elseif (strcmp(type,'file'))
            movefile(paths{i}, [backupPath '\' pathName], 'f');
        end
    end
    if (strcmp(type,'dir'))
        mkdir([paths{i}]);
    end
end
tempa=direx(backupPath,'/b');
if (isempty(tempa))
    rmdir(backupPath);
end
end