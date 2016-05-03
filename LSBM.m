function LSBM(infiles, outfiles)
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
rs2=RandStream.create('mrg32k3a','NumStreams',1,'Seed',infiles.IncDecKey);
pos=rs.randperm(nti);
sgn=rs2.rand(1,msglen);
sgn(sgn<0.5)=-1;
sgn(sgn>=0.5)=1;
t2=ti(pos(1:msglen));
posmod=bitxor(msgInBits.',logical(bitand(t2,1)));
t2t=double(t2(posmod))+double(int8(sgn(posmod)));
t2t(t2t<0)=1;t2t(t2t>255)=254;
t2(posmod)=uint8(t2t);
ti(pos(1:msglen))=t2;
ti=reshape(ti,sti);
imwrite(ti,outfiles.File1);
end