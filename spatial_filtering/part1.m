clear;
clc;
%�Աຯ��ʵ�־�ֵ�˲��� part1.m
I=imread('Letters-a.jpg');
figure,subplot(321),imshow(I)
title('ԭͼ');
img1=avg(I,3,0);
subplot(322),imshow(img1)
title('3��3��ֵ�˲�����Ե��0��䣩')
img2=avg(I,5,'replicate');
subplot(323),imshow(img2);
title('5��5��ֵ�˲��������ڲ��߽磩')
img4=avg(I,7,'circular');
subplot(324),imshow(img4);
title('7��7��ֵ�˲����߽�ͨ�����ں�����չ��')
img5=avg(I,9,'symmertic');
subplot(325),imshow(img5);
title('9��9��ֵ�˲����߽羵���䣩')