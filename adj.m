%% ��iseed������С�������������
%����start��           ���գ������
%����iseed��           ���ӳ���
%����dist��            �������
%���lst��             ��iseed������С�������������
function lst=adj(start,iseed,dist)
di=dist(iseed,:);           %iseed���������еľ�������
di(start)=inf;              %��iseed�����start�ľ�����Ϊ�����
[~,lst]=sort(di);           %��di��С��������
end