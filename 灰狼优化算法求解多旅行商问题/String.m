%% ��visit���ڵ�·�����Ƴ�����visit���ڵ�����l������
%����l��               Ҫ�Ӹ�·���Ƴ����е���Ŀ
%����visit��           �Ӹ�·���Ƴ��ĳ���
%����route��           visit���ڵ�·��
%����start��           ���գ������
%���Rroute��          �ӵ�ǰ·���������Ƴ�l�����еļ���
function Rroute=String(l,visit,route,start)
r_copy=route;                               %����·��
r_copy(r_copy==start)=[];                   %��start��r_copy��ɾ��
lr=numel(r_copy);                           %r_copy�г�����Ŀ
findv=find(r_copy==visit,1,'first');        %�ҳ�visit��r_copy�е�λ��
vLN=findv-1;                                %visit����Ԫ�ظ���
vRN=lr-findv;                               %visit�Ҳ��Ԫ�ظ���
%���vLNС
if vLN<=vRN
    if vRN<l-1
        nR=floor(l-1-vLN+rand*(vRN-l+1+vLN));
        nL=l-1-nR;                          %visit���Ҫ�Ƴ�Ԫ�ص���Ŀ
    end
    if (vLN<=l-1)&&(vRN>=l-1)
        nR=floor(l-1-vLN+rand*(vLN));
        nL=l-1-nR;                          %visit���Ҫ�Ƴ�Ԫ�ص���Ŀ
    end
    if vLN>l-1
        nR=floor(rand*vLN);                 %visit�Ҳ�Ҫ�Ƴ�Ԫ�ص���Ŀ
        nL=l-1-nR;                          %visit���Ҫ�Ƴ�Ԫ�ص���Ŀ
    end
    r_copy=r_copy(findv-nL:findv+nR);       %���ɾ������visit���ڵ�����l������
end
%���vRNС
if vLN>vRN
    if vLN<l-1
        nL=floor(l-1-vRN+rand*(vLN-l+1+vRN));
        nR=l-1-nL;                          %visit�Ҳ�Ҫ�Ƴ�Ԫ�ص���Ŀ
    end
    if (vRN<=l-1)&&(vLN>=l-1)
        nL=floor(l-1-vRN+rand*(vRN));
        nR=l-1-nL;                          %visit�Ҳ�Ҫ�Ƴ�Ԫ�ص���Ŀ
    end
    if vRN>l-1
        nL=floor(rand*vRN);                 %visit���Ҫ�Ƴ�Ԫ�ص���Ŀ
        nR=l-1-nL;                          %visit�Ҳ�Ҫ�Ƴ�Ԫ�ص���Ŀ
    end
    r_copy=r_copy(findv-nL:findv+nR);       %���ɾ������visit���ڵ�����l������
end
Rroute=r_copy;       
end