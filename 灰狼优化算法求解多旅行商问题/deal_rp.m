%% ����RP�����fRP����RP�пյ�����·��ɾ��
%����RP��          ����·�߷���
%���FRP��         ɾ����·�ߺ��RP
%���m��           ��������Ŀ
function [FRP,m]=deal_rp(RP)
RP(cellfun(@isempty,RP))=[];  %ɾ��cell�����еĿ�Ԫ��
FRP=RP;                       %��RP��ֵ��fRP
m=size(FRP,1);                %�·��������������̵���Ŀ
end