%% �޸����������ν�removed�еĳ��в�ص����߷�����
%�ȼ���removed�и������в�ص�ǰ�����������ġ�����ɱ�����Ȼ���ٴ���������������
%�ҳ�һ���ź�ֵ(������ɱ���2С-��ɱ���1С)���ĳ��в�أ�����ִ�У�ֱ��ȫ�����
%����removed��     ���Ƴ����еļ���
%����sdestroy��    �ƻ��������·�߷���
%����dist��        �������
%���srepairc��    �޸�������߷���
function srepair=repair(removed,sdestroy,dist)
srepair=sdestroy;                   %��ʼ���ƻ���Ľ⸳ֵ���޸���
%% �������removed�еĳ��У�ֱ��ȫ�����в��
while ~isempty(removed)
    [~,~,maxETD]=travel_distance(srepair,dist);    %���㵱ǰ��ĸ���·�ߵ����߾�������ֵ
    nr=numel(removed);              %�Ƴ������г�����Ŀ
    ri=zeros(nr,1);                 %�洢removed��������ò��·��
    rid=zeros(nr,1);                %�洢removed�����в����ò��·������ź�ֵ
    m=size(srepair,1);              %��ǰ�����������Ŀ
    %������㽫removed�еĳ��в�ص�ǰ���и�λ�ú�Ĳ���ɱ�
    for i=1:nr
        visit=removed(i);           %��ǰҪ��صĳ���
        dec=[];                     %��Ӧ�ڽ���ǰ���в�ص���ǰ���·�������С����ɱ�
        ins=[];                     %��¼���Բ��·�������
        for j=1:m
            route=srepair{j};         %��ǰ·�� 
            [~,deltaC]=insRoute(visit,route,dist,maxETD);
            dec=[dec;deltaC];
            ins=[ins;j];
        end
        [sd,sdi]=sort(dec);         %��dec��������
        insc=ins(sdi);              %��ins�������dec��������Ŷ�Ӧ
        ri(i)=insc(1);              %���µ�ǰ������ò��·��
        if size(dec,1)>1
            de12=sd(2)-sd(1);           %���㽫��ǰ���в�ص���ǰ����ź�ֵ
            rid(i)=de12;                %���µ�ǰ���в����á����·������ź�ֵ
        else
            de12=sd(1);                   %�����2С�ɱ��������1С�ɱ�������ֵ
            rid(i)=de12;                        %���µ�ǰ���в����á����·������ź�ֵ
        end
    end
    %����rid  rid���ĳ��о����Ȳ�صĳ���
    [~,firIns]=max(rid);            %�ҳ��ź�ֵ���ĳ������
    rIns=ri(firIns);                %���·�����
    %��firIns��ص�rIns
    srepair{rIns,1}=insRoute(removed(firIns),srepair{rIns,1},dist,maxETD);
    %��removed(firIns)���д�removed���Ƴ�
    removed(firIns)=[];
end
end