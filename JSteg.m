function JSteg(id,d,cover,stego,msgpath,embedrate,var,cover_ppm)
    jobj=jpeg_read(cover);
    [fpath,fname,fext]=fileparts(cover);
    accnt=sum(jobj.coef_arrays{1,1}(:)~=0)-jobj.image_width*jobj.image_height/64;
    msglength=floor(accnt*embedrate/8);
    MsgFile=[msgpath '\' fname '.bin'];
    GenMsg(id, msglength, MsgFile);
    command=[[var.exe '\cjpeg.exe -quality '] num2str(var.qf(d)) ' -steg ' MsgFile ' ' cover_ppm ' ' stego];
    [ret,~]=system(command);
    if(ret)   
        fprintf('����� %d ��ͼ��ʧ�ܡ�%s \n',id,stego);
    else
        fprintf('����� %d ��ͼ�񡾳ɹ���%s \n',id,stego);
    end
end