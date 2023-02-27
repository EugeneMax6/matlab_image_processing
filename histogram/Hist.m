%Hist.m
% 对图像直方图进行统计，其中counts是每个灰度值的个数，x代表灰度值的范围，默认为1:256
% 输入的a是bin的个数，类似imhist函数的用法
function [counts,x]=Hist(img,a)
if(~exist('a','var'))
    a=256;      %调用该函数时若未给a赋值，则a的默认值为256
end
x=1:a;
img=double(img);    %返回的counts矩阵也是double类型
[m,n]=size(img);
counts=zeros(a,1);  %灰度数矩阵
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