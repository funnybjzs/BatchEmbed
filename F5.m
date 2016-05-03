function F5(id,d,cover,stego,msgpath,embedrate,var)
    jobj=jpeg_read(cover);
    accnt=sum(jobj.coef_arrays{1,1}(:)~=0)-jobj.image_width*jobj.image_height/64;
    msglength=floor(accnt*embedrate/8);
    [fpath,fname,fext]=fileparts(cover);  
    MsgFile=[msgpath '\' fname '.bin'];
    GenMsg(id, msglength, MsgFile);
    
    cmd=['java.exe -Xmx1024M -jar ' [var.exe '\f5embed.jar -e '] MsgFile ' -p ' var.password ' -q ' num2str(var.qf(d)) ' ' cover ' ' stego];
    ret=system(cmd);
    if (ret)
        fprintf('���� ��%d ��ͼ��ʧ�ܡ�: %s\n',id,stego);
    else
        fprintf('���� ��%d ��ͼ�񡾳ɹ���: %s\n',id,stego);
    end
end