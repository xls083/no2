%% ��������������·�߷���·��ͼ
%����RP��              ����������·�߷���
%����vertexs��         �������еĺ�������
%����start��           ���գ������
function draw_Best(RP,vertexs,start)
start_v=vertexs(start,:);                       %����������
m=size(RP,1);                                   %��������Ŀ
figure
hold on;box on
title('')
hold on;
C=hsv(m);
for i=1:size(vertexs,1)
    text(vertexs(i,1)+0.5,vertexs(i,2),num2str(i));
end
for i=1:m
    route=RP{i};            %��i�������̵�����·��
    len=numel(route);       %��i�������������ʵĳ�����Ŀ�����������յ���У�
    fprintf('%s','������',num2str(i),'��');
    for j=1:len-1  
        fprintf('%d->',route(j));
        c_pre=vertexs(route(j),:);
        c_lastone=vertexs(route(j+1),:);
        plot([c_pre(1),c_lastone(1)],[c_pre(2),c_lastone(2)],'-','color',C(i,:),'linewidth',1);
    end
    fprintf('%d',route(end));
    fprintf('\n');
end
plot(vertexs(:,1),vertexs(:,2),'ro','linewidth',1);hold on;
plot(start_v(1,1),start_v(1,2),'s','linewidth',2,'MarkerEdgeColor','b',...
    'MarkerFaceColor','b','MarkerSize',10);
end