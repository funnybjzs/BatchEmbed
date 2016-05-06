function this=ParseArgs(this, varargin)
%PARSE_ARGS Parse arguments
%   Y=PARSE_ARGS('ARG_NAME1',ARG_VALUE1 ...) Parses the input arguments and
%   returns a structure Y with Y.ARG_NAME1=Y.ARG_VALUE1, etc.
for i=1:2:length(varargin)
    try
        this.(varargin{i})=varargin{i+1};
    catch
    end
end
end