%% �ҳ�����i���ڵ�·��,�Լ�����·�������
%����visit��       ���б��
%����RP��          ��ǰ���߷���
%���route��       ����visit��RP�����ڵ�·��
%���rindex��      ����visit��RP�����ڵ�·�����
function [route,rindex]=tour(visit,RP)
m=size(RP,1);
for i=1:m
    r=RP{i};
    fv=find(r==visit,1,'first');   
    if ~isempty(fv)
        route=r;
        rindex=i;
        break;
    end
end
end