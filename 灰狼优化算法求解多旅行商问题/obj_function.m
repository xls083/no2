%% ����һ����Ⱥ��Ŀ�꺯��ֵ
%���population��      ������Ⱥ
%����n��               ������Ŀ
%����m��               ��������Ŀ
%����start��           ���գ������
%����dist��            �������
%���obj��             ������Ⱥ��Ŀ�꺯��ֵ
function obj=obj_function(population,n,m,start,dist)
NIND=size(population,1);                        %��Ⱥ��Ŀ
obj=zeros(NIND,1);                              %��ʼ����ȺĿ�꺯��ֵ
for i=1:NIND
    individual=population(i,:);                 %��i�����Ǹ���
    RP=decode(individual,n,m,start);            %����i�����Ǹ������Ϊ���������߷���
    [~,~,maxETD]=travel_distance(RP,dist);      %����m�������������߾�������ֵ
    obj(i)=maxETD;                              %��maxETD��ֵ��Ŀ�꺯��ֵ
end
end