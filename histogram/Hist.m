%Hist.m
% ��ͼ��ֱ��ͼ����ͳ�ƣ�����counts��ÿ���Ҷ�ֵ�ĸ�����x����Ҷ�ֵ�ķ�Χ��Ĭ��Ϊ1:256
% �����a��bin�ĸ���������imhist�������÷�
function [counts,x]=Hist(img,a)
if(~exist('a','var'))
    a=256;      %���øú���ʱ��δ��a��ֵ����a��Ĭ��ֵΪ256
end
x=1:a;
img=double(img);    %���ص�counts����Ҳ��double����
[m,n]=size(img);
counts=zeros(a,1);  %�Ҷ�������
for i=1:m
    for j=1:n
        if(a==256)
        counts(img(i,j)+1)=counts(img(i,j)+1)+1;
        else
            t=floor(img(i,j)/(256/a))+1;
            counts(t)=counts(t)+1;
        end   
    end
end
end