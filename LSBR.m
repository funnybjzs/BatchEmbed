function LSBR(infiles, outfiles)
% ti=imread(infiles.File1);
ti=infiles.Img;
f=fopen(infiles.MsgFile,'rb');
try
    msg=uint8(fread(f));
catch ex
end
fclose(f);
msglen=numel(msg);
msg=[floor(msglen/256/256); mod(floor(msglen/256), 256); mod(msglen, 256); msg];
msglen=numel(msg)*8;
nti=numel(ti);
if (msglen>nti), msglen=nti; end
msgInBits=GetBitArray(msg,1,msglen);
sti=size(ti);
ti=reshape(ti,1,nti);
rs=RandStream.create('mrg32k3a','NumStreams',1,'Seed',infiles.PosKey);
pos=rs.randperm(nti);
t2=ti(pos(1:msglen));
t2=bitset(t2,1,msgInBits.');
ti(pos(1:msglen))=t2;
ti=reshape(ti,sti);
imwrite(ti,outfiles.File1);
end