%% ���Ƴ������е�Ԫ�شӵ�ǰ�����Ƴ�
%����removed��         ���Ƴ��ĳ��м���
%����RP��              ����������·�߷���
%���sdestroy��        �Ƴ�removed�еĳ��к��RP
function sdestroy=dealRemove(removed,RP)
%% ��removed�еĳ��д�VC���Ƴ�
sdestroy=RP;                %�Ƴ�removed�еĳ��к��RP
nre=length(removed);        %���ձ��Ƴ����е�������
m=size(RP,1);               %��������Ŀ
for i=1:m
    route=RP{i};
    for j=1:nre
        findri=find(route==removed(j),1,'first');
        if ~isempty(findri)
            route(route==removed(j))=[];
        end
    end
    sdestroy{i}=route;
end
sdestroy=deal_rp(sdestroy);
end