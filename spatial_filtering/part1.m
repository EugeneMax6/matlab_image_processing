clear;
clc;
%自编函数实现均值滤波器 part1.m
I=imread('Letters-a.jpg');
figure,subplot(321),imshow(I)
title('原图');
img1=avg(I,3,0);
subplot(322),imshow(img1)
title('3×3均值滤波（边缘用0填充）')
img2=avg(I,5,'replicate');
subplot(323),imshow(img2);
title('5×5均值滤波（复制内部边界）')
img4=avg(I,7,'circular');
subplot(324),imshow(img4);
title('7×7均值滤波（边界通过周期函数拓展）')
img5=avg(I,9,'symmertic');
subplot(325),imshow(img5);
title('9×9均值滤波（边界镜像反射）')