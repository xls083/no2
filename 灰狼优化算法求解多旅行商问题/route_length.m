%% ����һ��·���ܾ���
%����route��            һ��·��
%����dist��             �������
%���len��              ����·���ܾ���
function len=route_length(route,dist)
n=numel(route);         %����·�����������е���Ŀ�����������յ����
len=0;
for k=1:n-1
    i=route(k);
    j=route(k+1);
    len=len+dist(i,j);
end
end