%% Adjacent String Removal���ݵ�ǰ�����������k���ٽ�·���е�ÿ��·�����Ƴ�l������
%����RP��              ����������·�߷���
%����k��               �Ƴ�����·������Ŀ
%����n��               ������Ŀ
%����m��               ��������Ŀ
%����start��           ���գ������
%����dist��            �������
%���removed��         ���Ƴ��ĳ��м���
%���sdestroy��        �Ƴ�removed�еĳ��к��RP
function [removed,sdestroy]=remove(RP,n,m,k,start,dist)
avgt=floor((n-1)/m);                        %ƽ��ÿ��·���ϵĳ�����Ŀ
removed=[];                                 %���Ƴ����еļ���
T=[];                                       %���ƻ�·���ļ���
iseed=ceil(rand*(n-1));                     %�ӵ�ǰ�������ѡ��Ҫ���Ƴ��ĳ���
lst=adj(start,iseed,dist);                  %��iseed������С�������������
for i=1:numel(lst)
    if numel(T)<k
        [r,rindex]=tour(lst(i),RP);         %�ҳ�����lst(i)����·�������
        fr=find(T==rindex,1,'first');       %���ƻ�·�������в����Ƿ��и�·��
        %���Ҫ�ƻ���·������T��
        if isempty(fr)
            lmax=min(numel(r)-2,avgt);              %�ӵ�ǰ·��������Ƴ��ĳ�����Ŀ
            %ֻ�е���ǰ·�����پ���һ������ʱ�������������յ㣩���ſ����Ƴ�����
            if lmax>=1
                l=randi([1,lmax],1,1);              %�����ڸ���·�����Ƴ��ĳ��е���Ŀ
                Rroute=String(l,lst(i),r,start);    %��·��r���Ƴ�����lsr(i)���ڵ�l�������ĳ���
                removed=[removed Rroute];           %��Rroute��ӵ�removed��
                T=[T rindex];                       %���ƻ���·����ӵ�T��
            end
        end
    else
        break;
    end
end
%% ��removed�еĳ��д�RP���Ƴ�
sdestroy=dealRemove(removed,RP);
end