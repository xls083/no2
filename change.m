%% ���߷�������Ǹ���֮�����ת��
%����RP��          ����������·�߷���
%���individual��  ���Ǹ���
function individual=change(RP)
m=size(RP,1);                   %��������Ŀ
individual=[];
lr=zeros(1,m);                  %ÿ��������������ĳ�����Ŀ
for i=1:m
    route=RP{i};
    start=route(1);
    route(route==start)=[];
    lr(i)=numel(route);
    individual=[individual,route];
end
individual=[individual,lr];
end