clear;
close all;
clc;
%% ʹ��matlab�Դ�����ʵ��ֱ��ͼ�ľ��⻯�͹涨��
G=imread('lena.bmp');
g1=imread('lady.bmp');
g2=imhist(g1);
z1=histeq(G);%ֱ��ͼ���⻯
z2=histeq(G,g2);%ֱ��ͼ�涨��

figure
set(figure(1),'Position',[100,100,1400,600]);
subplot(2,4,1);imshow(G);title('ԭͼ��');
subplot(2,4,2);imshow(z1);title('���⻯ͼ��');
subplot(2,4,3);imshow(g1);title('ƥ��ͼ��');
subplot(2,4,4);imshow(z2);title('ƥ���ͼ��');

subplot(2,4,5);imhist(G,64);title('ԭͼ��ֱ��ͼ');
subplot(2,4,6);imhist(z1,64);title('���⻯ͼ��ֱ��ͼ');
subplot(2,4,7);imhist(g1,64);title('ƥ��ͼ��ֱ��ͼ');
subplot(2,4,8);imhist(z2,64);title('ƥ���ͼ��ֱ��ͼ');

