%% �������������̵������ܾ��롢ÿ�������̵����߾��롢�Լ��������̵����߾�������ֵ
%����RP��              ����������·�߷���
%����dist��            �������
%���sumTD��           ���������̵������ܾ���
%���everyTD��         ÿ�������̵����߾���
%���maxETD��          everyTD�е����ֵ
function [sumTD,everyTD,maxETD]=travel_distance(RP,dist)
m=size(RP,1);                       %��������Ŀ
everyTD=zeros(m,1);                 %��ʼ��ÿ�������̵����߾���
for i=1:m
    route=RP{i};                    %ÿ�������̵�����·��
    everyTD(i)=route_length(route,dist);
end
sumTD=sum(everyTD);                 %���������̵������ܾ���
maxETD=max(everyTD);                %everyTD�е����ֵ
end