%% ���ݳ�����Ŀ����������Ŀ�Լ����գ�����б�������Ǹ���
%����n��               ������Ŀ
%����m��               ��������Ŀ
%����start��           ���գ������
%���individual��      ���Ǹ���
function individual=encode(n,m,start)
%% ���ɻ��Ǹ���ĵ�һ����
part1=randperm(n);                              %�Գ��н����������
part1(part1==start)=[];                         %�����գ�����д�part1��ɾ��
%% ���ɻ��Ǹ���ĵڶ�����
part2=zeros(1,m);                               %��ʼ��ÿ�������̷��ʳ�����Ŀ��������start��
if m==1
    part2=n-1;
else
    for i=1:m
        if i==1
            right=n-1-(m-1);                        %���ȡֵ
            part2(i)=randi([1,right],1,1);
        elseif i==m
            part2(i)=n-1-sum(part2(1:(i-1)));
        else
            right=n-1-(m-i)-sum(part2(1:(i-1)));    %���ȡֵ
            part2(i)=randi([1,right],1,1);
        end
    end
end
%% �������ֽ��кϲ����������ջ��Ǹ���
individual=[part1,part2];                       %�����κϲ�
end