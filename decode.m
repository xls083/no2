%% �Ի��Ǹ�����н��룬����Ϊ����������·�߷���
%����individual��      ���Ǹ���
%����n��               ������Ŀ
%����m��               ��������Ŀ
%����start��           ���գ������
%���RP��              ����������·�߷���
function RP=decode(individual,n,m,start)
RP=cell(m,1);                       %��ʼ��m������·��
part1=individual(1:n-1);            %��ȡ������������
part2=individual(n:(n+m-1));        %��ȡ���������������ʳ��е���Ŀ
for i=1:m
    if i==1
        left=1;                     %��part1�У���i�������̷��ʳ��е���ţ�����start����ǰ������һ��������part1�е����
        right=part2(i);             %��part1�У���i�������̷��ʳ��е���ţ���������start��ǰһ��������part1�е����
        route=[start,part1(left:right),start];  %��start��ӵ�����·�ߵ���ĩλ��
    else
        left=sum(part2(1:(i-1)))+1; %��part1�У���i�������̷��ʳ��е���ţ�����start����ǰ������һ��������part1�е����
        right=sum(part2(1:i));      %��part1�У���i�������̷��ʳ��е���ţ���������start��ǰһ��������part1�е����
        route=[start,part1(left:right),start];  %��start��ӵ�����·�ߵ���ĩλ��
    end
    RP{i,1}=route;
end
end