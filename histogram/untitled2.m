clear;
close all;
clc;
%% 自编函数实现均衡化和规定化
%不使用histeq函数，使用imhist函数对图像直方图的各灰度值进行统计和绘制图像的直方图

%均衡化
img=imread('lena.bmp');
hist1=imhist(img);           %统计图像直方图每个灰度值的个数
[h,w]=size(img);
new_img=zeros(h,w);
s=zeros(1,256);
s(1)=hist1(1);
for t=2:256
    s(t)=s(t-1)+hist1(t);              % 计算新的灰度值
end
for i=1:w
    for j=1:h
        new_img(j,i)=s(img(j,i)+1)/(w*h);       % 生成新图像
    end
end
new_img=im2uint8(new_img);      %上一步生成新图像运算过程中是double类型，将double转换为无符号8位整型
figure
set(figure(1),'Position',[100,100,1400,600])
subplot(241),imshow(img);
title('原图')
subplot(242),imshow(new_img);
title('自编函数均衡化后')
subplot(245),imhist(img,64);
title('原图直方图')
subplot(246),imhist(new_img,64);
title('均衡化后的直方图')

%规定化
img_match=imread('lady.bmp');           %匹配图像
subplot(243),imshow(img_match)
title('匹配图像')
subplot(247),imhist(img_match,64)
title('匹配图像的直方图')
hist2=imhist(img_match);
%建立映射
cdf=cumsum(hist1) / numel(img); 
cdfRef=cumsum(hist2) / numel(img_match);
M=zeros(1,256,'uint8');
for k = 1 : 256
    [tmp,ind] = min(abs(cdf(k) - cdfRef));    %找到两图像之间每一个灰度的对应关系
    M(k)    = ind-1;
end
%利用映射生成新的图像
imMatch = M(img+1);
subplot(244),imshow(imMatch)
title('自编直方图匹配后')
subplot(248),imhist(imMatch,64);
title('匹配后的直方图')
