clear;
close all;
clc;
%% 使用matlab自带函数实现直方图的均衡化和规定化
G=imread('lena.bmp');
g1=imread('lady.bmp');
g2=imhist(g1);
z1=histeq(G);%直方图均衡化
z2=histeq(G,g2);%直方图规定化

figure
set(figure(1),'Position',[100,100,1400,600]);
subplot(2,4,1);imshow(G);title('原图像');
subplot(2,4,2);imshow(z1);title('均衡化图像');
subplot(2,4,3);imshow(g1);title('匹配图像');
subplot(2,4,4);imshow(z2);title('匹配后图像');

subplot(2,4,5);imhist(G,64);title('原图像直方图');
subplot(2,4,6);imhist(z1,64);title('均衡化图像直方图');
subplot(2,4,7);imhist(g1,64);title('匹配图像直方图');
subplot(2,4,8);imhist(z2,64);title('匹配后图像直方图');

