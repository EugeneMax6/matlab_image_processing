clc;
clear all;
close all;
I=imread('pic2.jpg');
I=rgb2gray(I);
figure,subplot(131)
imshow(I);
%水平变换
[m n]=size(I);
I1(1:m,1:n)=I(m:-1:1,1:n);
subplot(132),imshow(I1);
%垂直变换
I2(1:m,1:n)=I(1:m,n:-1:1);
subplot(133),imshow(I2)