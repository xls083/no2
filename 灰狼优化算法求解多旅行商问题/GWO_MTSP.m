tic
clear
clc
%% ��������
dataset=importdata('input.txt');                    %�����У�ÿһ�еĺ���ֱ�Ϊ[��ţ�x���꣬y����]
x=dataset(:,2);                                     %x����
y=dataset(:,3);                                     %y����
vertexs=dataset(:,2:3);                             %��ȡ�������е�xy����
n=size(dataset,1);                                  %������Ŀ
m=5;                                                %��������Ŀ
start=1;                                            %������
h=pdist(vertexs);                                   %�����������֮��ľ��룬һ����1+2+......+(n-1)=n*(n-1)/2��
dist=squareform(h);                                 %����������֮��ľ���ת��Ϊn��n�еľ������
%% �����㷨��������
NIND=32;                                            %���Ǹ�����Ŀ
MAXGEN=200;                                         %����������
k=m;                                                %�Ƴ�����·������Ŀ
%% ��ʼ����Ⱥ
population=init_pop(NIND,n,m,start);
init_obj=obj_function(population,n,m,start,dist);   %��ʼ��ȺĿ�꺯��ֵ
%% �����Ż�
gen=1;                                              %������
best_alpha=zeros(MAXGEN,n+m-1);                     %��¼ÿ�ε���������ȫ�����Ż��Ǹ���
best_obj=zeros(MAXGEN,1);                           %��¼ÿ�ε���������ȫ�����Ż��Ǹ����Ŀ�꺯��ֵ

alpha_individual=population(1,:);                   %��ʼ���Ǧ�����
alpha_obj=init_obj(1);                              %��ʼ���Ǧ���Ŀ�꺯��ֵ
beta_individual=population(2,:);                    %��ʼ���Ǧ¸���
beta_obj=init_obj(2);                               %��ʼ���Ǧµ�Ŀ�꺯��ֵ
delta_individual=population(3,:);                   %��ʼ���Ǧĸ���
delta_obj=init_obj(3);                              %��ʼ���Ǧĵ�Ŀ�꺯��ֵ
while gen<=MAXGEN
    obj=obj_function(population,n,m,start,dist);    %���������ȺĿ�꺯��ֵ
    %% ȷ����ǰ��Ⱥ�еĻ��Ǧ����塢���Ǧ¸���ͻ��Ǧĸ���
    for i=1:NIND
        %���»��Ǧ�����
        if obj(i,1)<alpha_obj 
            alpha_obj=obj(i,1); 
            alpha_individual=population(i,:);
        end
        %���»��Ǧ¸���
        if obj(i,1)>alpha_obj && obj(i,1)<beta_obj 
            beta_obj=obj(i,1); 
            beta_individual=population(i,:);
        end
        %���»��Ǧĸ���
        if obj(i,1)>alpha_obj && obj(i,1)>beta_obj && obj(i,1)<delta_obj 
            delta_obj=obj(i,1); 
            delta_individual=population(i,:);
        end
    end
    %% ���µ�ǰ��Ⱥ�л��Ǹ����λ��
    for i=1:NIND
        r=rand;
        individual=population(i,:);                 %��i�����Ǹ���
        %���ʸ��»��Ǹ���λ��
        if r<=1/3
            new_individual=cross(individual,alpha_individual,n);
        elseif r<=2/3
            new_individual=cross(individual,beta_individual,n);
        else
            new_individual=cross(individual,delta_individual,n);
        end
        population(i,:)=new_individual;             %���µ�i�����Ǹ���
    end
    %% �ֲ���������
    [alpha_individual,alpha_obj]=LocalSearch(alpha_individual,n,m,k,start,dist);
    [beta_individual,beta_obj]=LocalSearch(beta_individual,n,m,k,start,dist);
    [delta_individual,delta_obj]=LocalSearch(delta_individual,n,m,k,start,dist);
    %% ��¼ȫ�����Ż��Ǹ���
    best_alpha(gen,:)=alpha_individual;             %��¼ȫ�����Ż��Ǹ���
    best_obj(gen,1)=alpha_obj;                      %��¼ȫ�����Ż��Ǹ����Ŀ�꺯��ֵ
    %% ��ӡ��ǰ����ȫ�����Ž�
    disp(['��',num2str(gen),'�����Ž��Ŀ�꺯��ֵ��',num2str(alpha_obj)])
    %% ���¼�����
    gen=gen+1;                                      %��������1
end
%% ��ӡÿ�ε�����ȫ�����Ż��Ǹ����Ŀ�꺯��ֵ�仯����ͼ
figure;
plot(best_obj,'LineWidth',1);
title('�Ż�����')
xlabel('��������');
ylabel('�����ܾ���');
%% ��ȫ�����Ż��Ǹ������Ϊ����������·�߷���
bestRP=decode(alpha_individual,n,m,start);          %��ȫ�����Ż��Ǹ������Ϊ���������߷���
[bestTD,bestETD,bestMETD]=travel_distance(bestRP,dist);   %ȫ�����Ż��Ǹ����Ŀ�꺯��ֵ
%% ������������·��ͼ
draw_Best(bestRP,vertexs,start);
toc