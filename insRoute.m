%% ���㽫��ǰ���в�ص���ǰ·���С�����ɱ�����С��λ��
%����visit         ���������
%����route��       һ������·��
%����dist��        �������
%���newRoute��    ��visit���뵽��ǰ·�����λ�ú������·��
%���deltaC��      ��visit���뵽��ǰ·�����λ�ú�Ĳ���ɱ�
function [newRoute,deltaC]=insRoute(visit,route,dist,maxETD)
start=route(1);                             %���գ������
rcopy=route;                                %����·��
rcopy(rcopy==start)=[];                     %��start��rcopy��ɾ��
lr=numel(route)-2;                          %��ȥ�����к��յ�����⣬��ǰ·���ϵĳ�����Ŀ
%�Ƚ����в�ص�������С��λ��
rc0=[];                                     %��¼������к����Լ����·��
delta0=[];                                  %��¼������к������
for i=1:lr+1
    if i==lr+1
        rc=[start,rcopy,visit,start];
    elseif i==1
        rc=[start,visit,rcopy,start];
    else
        rc=[start,rcopy(1:i-1),visit,rcopy(i:end),start];
    end
    rc0=[rc0;rc];                           %��·���洢��rc0������rc0��delta0��Ӧ
    alen=route_length(rc,dist);
    dif=alen-maxETD;                        %�������ɱ�
    delta0=[delta0;dif];                    %������ɱ��洢��delta0
end
[deltaC,ind]=min(delta0);
newRoute=rc0(ind,:);
end