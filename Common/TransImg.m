function TransImg(srcPath, dstPath, srcFmt, dstFmt, isToGray)
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here
if nargin<5, isToGray=false; end
if (~exist(dstPath,'dir'))
    mkdir(dstPath);
end
files=dir([srcPath '\*.' srcFmt]);
failedcnt=0;
for i=1:length(files)
    try
        im=imread([srcPath '\' files(i).name]);
        if (isToGray && size(im,3)==3)
            im=rgb2ycbcr(im2double(im));
            im=im2uint8(im(:,:,1));
        elseif (~isToGray && size(im,3)==1)
            tim=im; im=zeros(size(im,1),size(im,2),3,'uint8');
            im(:,:,1)=tim;im(:,:,2)=tim;im(:,:,3)=tim;
            clear tim;
        end
        imwrite(im,[dstPath '\' files(i).name(1:end-length(srcFmt)) dstFmt]);
    catch ex
        fprintf('* Error in %s:\n%s', files(i).name, ex.getReport);
        failedcnt=failedcnt+1;
    end
end
fprintf('* Report: %3d file(s) proccessed, %3d of them failed.\n', length(files), failedcnt);
end