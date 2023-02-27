clear;
close all;
clc;
%% �Աຯ��ʵ�־��⻯�͹涨��
%��ʹ��histeq������imhist�������Ա�Hist������ͼ��ֱ��ͼ�ĸ��Ҷ�ֵ����ͳ�ƣ�ʹ��bar��������ֱ��ͼ

%���⻯
img=imread('lena.bmp');
hist1=Hist(img);           %ͳ��ͼ��ֱ��ͼÿ���Ҷ�ֵ�ĸ���
[h w]=size(img);
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
set(figure(1),'Position',[100,100,1400,600]);
subplot(241),imshow(img);
title('ԭͼ')
subplot(242),imshow(new_img);
title('�Աຯ�����⻯��')
% ����ֱ��ͼ������imhist��ʹ��64��bin
subplot(245),bar(Hist(img,64),'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',0.1)
title('ԭͼֱ��ͼ')
subplot(246),bar(Hist(new_img,64),'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',0.1)
title('���⻯���ֱ��ͼ')

%�涨��
img_match=imread('lady.bmp');       %ƥ��ͼ��
subplot(243),imshow(img_match)
title('ƥ��ͼ��')
hist2=Hist(img_match);
% ����ƥ��ͼ���ֱ��ͼ
subplot(247),bar(Hist(img_match,64),'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',0.1)
title('ƥ��ͼ���ֱ��ͼ')

cdf=cumsum(hist1) / numel(img);  %�����ۻ��ֲ�����
cdf2=cumsum(hist2) / numel(img_match);
M=zeros(1,256,'uint8');  %����ӳ��
for k=1:256
    [~,ind]=min(abs(cdf(k) - cdf2));  %�ҵ���ͼ��֮��ÿһ���ҶȵĶ�Ӧ��ϵ
    M(k)=ind-1;
end
imMatch = M(img+1); 
subplot(244),imshow(imMatch)
title('�Աຯ��ƥ���')
subplot(248),bar(Hist(imMatch,64),'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',0.1)
title('ƥ����ֱ��ͼ')
