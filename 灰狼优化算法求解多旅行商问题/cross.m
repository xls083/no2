%% ���������Ǹ�����н������
%����individual1��     ���Ǹ���1
%����individual2��     ���Ǹ���2
%����n��               ������Ŀ
%���individual1��     �����Ļ��Ǹ���1
%���individual2��     �����Ļ��Ǹ���2
function [individual1,individual2]=cross(individual1,individual2,n)
cities_ind1=individual1(1:n-1); %���Ǹ���1���г�������
cities_ind2=individual2(1:n-1); %���Ǹ���2���г�������
L=n-1;                          %���Ǹ����г���������Ŀ
while 1
    r1=randsrc(1,1,[1:L]);
    r2=randsrc(1,1,[1:L]);
    if r1~=r2
        s=min([r1,r2]);
        e=max([r1,r2]);
        a0=[cities_ind2(s:e),cities_ind1];
        b0=[cities_ind1(s:e),cities_ind2];
        for i=1:length(a0)
            aindex=find(a0==a0(i));
            bindex=find(b0==b0(i));
            if length(aindex)>1
                a0(aindex(2))=[];
            end
            if length(bindex)>1
                b0(bindex(2))=[];
            end
            if i==length(cities_ind1)
                break
            end
        end
        cities_ind1=a0;
        cities_ind2=b0;
        break
    end
end
individual1(1:n-1)=cities_ind1;     %���»��Ǹ���1���г�������
individual2(1:n-1)=cities_ind2;     %���»��Ǹ���2���г�������
end