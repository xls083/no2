%% �ֲ���������
%���individual��      ���Ǹ���
%����n��               ������Ŀ
%����m��               ��������Ŀ
%����k��               �Ƴ�����·������Ŀ
%����start��           ���գ������
%����dist��            �������
%���individual��      �ֲ�������Ļ��Ǹ���
%���ind_obj��         �ֲ�������Ļ��Ǹ����Ŀ�꺯��ֵ
function [individual,ind_obj]=LocalSearch(individual,n,m,k,start,dist)
alpha_RP=decode(individual,n,m,start);                      %�����Ǹ������Ϊ���������߷���
[~,~,alpha_TD1]=travel_distance(alpha_RP,dist);             %���Ǹ����Ŀ�꺯��ֵ
[removed1,sdestroy1]=remove(alpha_RP,n,m,k,start,dist);     %�Ի��Ǹ�������Ƴ�����
s_alpha=repair(removed1,sdestroy1,dist);                    %�Ի��Ǹ�������޸�����
[~,~,alpha_TD2]=travel_distance(s_alpha,dist);              %���Ǹ����޸����Ŀ�꺯��ֵ
%% ֻ��Ŀ�꺯��ֵ��С���Ż���������߷�������ת��Ϊ���Ǹ���
if alpha_TD2<alpha_TD1
    individual=change(s_alpha);
end
ind_obj=obj_function(individual,n,m,start,dist);            %����individual��Ŀ�꺯��ֵ
end