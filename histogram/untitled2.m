clear;
close all;
clc;
%% �Աຯ��ʵ�־��⻯�͹涨��
%��ʹ��histeq������ʹ��imhist������ͼ��ֱ��ͼ�ĸ��Ҷ�ֵ����ͳ�ƺͻ���ͼ���ֱ��ͼ

%���⻯
img=imread('lena.bmp');
hist1=imhist(img);           %ͳ��ͼ��ֱ��ͼÿ���Ҷ�ֵ�ĸ���
[h,w]=size(img);
new_img=zeros(h,w);
s=zeros(1,256);
s(1)=hist1(1);
for t=2:256
    s(t)=s(t-1)+hist1(t);              % �����µĻҶ�ֵ
end
for i=1:w
    for j=1:h
        new_img(j,i)=s(img(j,i)+1)/(w*h);       % ������ͼ��
    end
end
new_img=im2uint8(new_img);      %��һ��������ͼ�������������double���ͣ���doubleת��Ϊ�޷���8λ����
figure
set(figure(1),'Position',[100,100,1400,600])
subplot(241),imshow(img);
title('ԭͼ')
subplot(242),imshow(new_img);
title('�Աຯ�����⻯��')
subplot(245),imhist(img,64);
title('ԭͼֱ��ͼ')
subplot(246),imhist(new_img,64);
title('���⻯���ֱ��ͼ')

%�涨��
img_match=imread('lady.bmp');           %ƥ��ͼ��
subplot(243),imshow(img_match)
title('ƥ��ͼ��')
subplot(247),imhist(img_match,64)
title('ƥ��ͼ���ֱ��ͼ')
hist2=imhist(img_match);
%����ӳ��
cdf=cumsum(hist1) / numel(img); 
cdfRef=cumsum(hist2) / numel(img_match);
M=zeros(1,256,'uint8');
for k = 1 : 256
    [tmp,ind] = min(abs(cdf(k) - cdfRef));    %�ҵ���ͼ��֮��ÿһ���ҶȵĶ�Ӧ��ϵ
    M(k)    = ind-1;
end
%����ӳ�������µ�ͼ��
imMatch = M(img+1);
subplot(244),imshow(imMatch)
title('�Ա�ֱ��ͼƥ���')
subplot(248),imhist(imMatch,64);
title('ƥ����ֱ��ͼ')
