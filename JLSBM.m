function JLSBM(id,d,cover,stego,msgpath,embedrate,var)
    jobj=jpeg_read(cover);
    accnt=sum(jobj.coef_arrays{1,1}(:)~=0)-jobj.image_width*jobj.image_height/64;
    msglength=floor(accnt*embedrate/8);
    [fpath,fname,fext]=fileparts(cover);
    MsgFile=[msgpath '\' fname '.bin'];
    GenMsg(id, msglength, MsgFile);

    ti=jobj.coef_arrays{1,1};
    f=fopen(MsgFile,'rb');
    try
        msg=uint8(fread(f));
    catch ex
    end
    fclose(f);
    msglen=numel(msg);
    msg=[floor(msglen/256/256); mod(floor(msglen/256), 256); mod(msglen, 256); msg];
    %msglen: 消息比特位长度
    msglen=numel(msg)*8;
    %nti: 载体cover字节数
    nti=numel(ti);
    %changemask: 0系数不嵌入，直流系数不嵌入；可嵌入字节标记为1并提取索引(按列排序)
    changemask = (ti~=0);
    changemask(1:8:end, 1:8:end) = 0;
    changemask=find(changemask);

    sti=size(ti);
    ti=reshape(ti,1,nti);
    %pos：随机混洗后的索引
    rs=RandStream.create('mrg32k3a','NumStreams',1,'Seed',id);
    pos=changemask(rs.randperm(size(changemask,1)));
    %sgn:随机数决定+/- 1，长度msglen
    rs2=RandStream.create('mrg32k3a','NumStreams',1,'Seed',id+10000);
    sgn=rs2.rand(1,msglen);
    sgn(sgn<0.5)=-1;
    sgn(sgn>=0.5)=1;
    %msgInbits：msg比特
    if (msglen>size(changemask,1)), msglen=size(changemask,1); end
    msgInBits=GetBitArray(msg,1,msglen);

    t2=ti(pos(1:msglen));
    s=sign(t2); %获得正负符号
    t2_conv=s.*t2; %全部取正
    posmod=bitxor(msgInBits.',logical(bitand(t2_conv,1))); %最低位是否与消息比特相同
    t2t=double(t2(posmod))+double(int8(sgn(posmod))); %t2t为嵌入后的数值
    t2t(t2t<-1024)=-1023;t2t(t2t>1023)=1022;
    t2(posmod)=t2t;
    ti(pos(1:msglen))=t2;
    ti=reshape(ti,sti);
    jobj.coef_arrays{1,1}=ti;
    jpeg_write(jobj,stego);
    fprintf('处理 第%d 张图像【成功】: %s \n',id,stego);
end