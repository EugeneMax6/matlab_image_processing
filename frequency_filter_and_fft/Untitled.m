%% part 1 使用MATLAB中的函数fft2，fftshift，ifft2实现一幅灰度图像从空域变换到频域
clc,clear,close all
f=imread('lena.bmp');
subplot(2,2,1);imshow(f);title('原图');
F=fft2(f);          %快速傅里叶变换
F1=log(abs(F)+1);   %取模并进行缩放 
subplot(2,2,2);imshow(F1,[]);title('傅里叶频谱图');
Fs=fftshift(F);      %FFT频谱中心化，将频谱图中零频率成分移动至频谱图中心
S=log(abs(Fs)+1);    %取模并进行缩放 
subplot(2,2,3);imshow(S,[]);title('频率移到中心后的频谱图');
fr=real(ifft2(ifftshift(Fs)));  %反傅里叶变换，频率域变换到空间域，并取实部
ret=im2uint8(mat2gray(fr));    %更改图像类型
subplot(2,2,4);imshow(ret),title('逆傅里叶变换');

%% part 2  对灰度图像进行空域/频域滤波
f = imread('lena.bmp');
figure,subplot(221),imshow(f);title('原图');
f=im2double(f);         %转换为double
F=fft2(f);              %快速傅里叶变换，空域转到频域
S=fftshift(log(abs(F)+1));      %取模、缩放、中心化
subplot (222),imshow(S),title('傅里叶频谱图');
%空间滤波器
h=fspecial('sobel');        %sobel滤波器
gs=imfilter(f,h);           %空域滤波
subplot(223),imshow(gs,[]),title('空域滤波结果');
%频域滤波
PQ=paddedsize(size(f));             %图像边缘扩充
H=freqz2(h,PQ(2),PQ(1));        %首先把空间滤波器转成频域滤波器
F1=fftshift(fft2(f,PQ(1),PQ(2)));           %频谱中心化
G1=F1.*H;           %图像变换与滤波函数相乘
g1=real(ifft2(G1));                 %取傅里叶反变换的实部
gf=g1(1:size(f,1),1:size(f,2));         %取图像原始大小的部分
subplot(224),imshow(gs,[]),title('频域滤波结果');


%% part3.1 使用MATLAB中的函数lpfilter()，低通滤波
clear,clc;
f=imread('lena.bmp');
figure,subplot(221),imshow(f);title('原图');
%生成低通滤波器
PQ=paddedsize(size(f));     %图像边缘拓展
D0=0.05*PQ(1);      %滤波器半径是D0
H1=lpfilter('ideal',PQ(1),PQ(2),D0);        %理想低通滤波器
H2=lpfilter('btw',PQ(1),PQ(2),D0,2);        %巴特沃斯低通滤波器
H3=lpfilter('gaussian',PQ(1),PQ(2),D0);     %高斯低通滤波器
%进行频域滤波
%计算填充后的图像的傅里叶变换
F=fft2(f,PQ(1),PQ(2));
%图像变换与滤波器函数相乘
G1=F.*H1;
G2=F.*H2;
G3=F.*H3;
%计算G的傅里叶反变换的实部
g1=real(ifft2(G1));
g2=real(ifft2(G2));
g3=real(ifft2(G3));
%将图像g剪裁到原始图像f的大小
gf1=mat2gray(g1(1:size(f,1),1:size(f,2)));
gf2=mat2gray(g2(1:size(f,1),1:size(f,2)));
gf3=mat2gray(g3(1:size(f,1),1:size(f,2)));
subplot(222),imshow(gf1,[]),title('理想低通滤波结果')
subplot(223),imshow(gf2,[]),title('巴特沃斯低通滤波结果')
subplot(224),imshow(gf3,[]),title('高斯低通滤波结果')

%% part3.2 使用MATLAB中的函数hpfilter()
clear,clc;
f=imread('lena.bmp');
figure,subplot(221),imshow(f);title('原图');
%生成高通滤波器
PQ=paddedsize(size(f));
D0=0.05*PQ(1);      %半径是D0
H1=hpfilter('ideal',PQ(1),PQ(2),D0);        %理想高通滤波器
H2=hpfilter('btw',PQ(1),PQ(2),D0,2);        %巴特沃斯高通滤波器
H3=hpfilter('gaussian',PQ(1),PQ(2),D0);     %高斯低通滤波器  
%进行频域滤波
%计算填充后的图像的傅里叶变换
F=fft2(f,PQ(1),PQ(2));
%图像变换与滤波函数相乘
G1=F.*H1;
G2=F.*H2;
G3=F.*H3;
%计算G的傅里叶反变换的实部
g1=real(ifft2(G1));
g2=real(ifft2(G2));
g3=real(ifft2(G3));
%将图像g剪裁到原始图像f的大小
gf1=mat2gray(g1(1:size(f,1),1:size(f,2)));
gf2=mat2gray(g2(1:size(f,1),1:size(f,2)));
gf3=mat2gray(g3(1:size(f,1),1:size(f,2)));
subplot(222),imshow(gf1,[]),title('理想高通滤波结果')
subplot(223),imshow(gf2,[]),title('巴特沃斯高通滤波结果')
subplot(224),imshow(gf3,[]),title('高斯高通滤波结果')

%% part4 自编实现快速傅里叶变换函数fft2，实现对一幅灰度图像实现傅里叶变换。
clear;
clc;
%实现一幅灰度图像（lena.bmp）从空域变换到频域
image=imread('lena.bmp');
im=im2double(image);
image_f=myfft2(im);  %傅里叶变换
image_f1=log(abs(image_f)+1); %对数进行缩放
image2=fftshift(image_f); %频谱中心化
image2=log(abs(image2)+1); %对数进行缩放
figure(1)
subplot(221);imshow(image);title('原图');
subplot(222);imshow(image_f1,[]);title('傅里叶变换频谱图');
subplot(223);imshow(image2,[]);title('频谱中心化');
image_if=im2uint8(real(ifft2(image_f))); %反傅里叶变换
subplot(224);imshow(image_if);title('反傅里叶变换');
