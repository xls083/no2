%% ��ʼ��������Ⱥ
%����NIND��            ��Ⱥ��Ŀ
%����n��               ������Ŀ
%����m��               ��������Ŀ
%����start��           ���գ������
%���population��      ������Ⱥ
function population=init_pop(NIND,n,m,start)
len=n+m-1;                              %���峤��
population=zeros(NIND,len);             %��ʼ����Ⱥ
for i=1:NIND
    population(i,:)=encode(n,m,start);
end
end