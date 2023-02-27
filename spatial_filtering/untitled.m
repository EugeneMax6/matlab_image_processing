%% 使用matlab内置函数的均值滤波器
Image=imread('Letters-a.jpg');
w1=fspecial('average',3);       % 3×3均值滤波模板
w2=fspecial('average',5);       % 5×5均值滤波模板
w3=fspecial('average',7);
w4=fspecial('average',9);
result1=imfilter(Image,w1,'conv','replicate');
result2=imfilter(Image,w2,'conv','replicate');
result3=imfilter(Image,w3,'conv','replicate');
result4=imfilter(Image,w4,'conv','replicate');
figure
subplot(151),imshow(Image),title('原图')
subplot(152),imshow(uint8(result1)),title('3×3均值滤波')
subplot(153),imshow(uint8(result2)),title('5×5均值滤波')
subplot(154),imshow(uint8(result3)),title('7×7均值滤波')
subplot(155),imshow(uint8(result4)),title('9×9均值滤波')

%% Sobel锐化
I = imread('lotus.bmp');
I=rgb2gray(I);
H1=[-1 -2 -1;0 0 0;1 2 1];H2=[-1 0 1;-2 0 2;-1 0 1];        %Sobel算子模板
R1= imfilter(I,H1);
R2= imfilter(I,H2);
edge=abs(R1)+abs(R2);           % 基于模板运算获取Sobel梯度图像
img=I+edge;     %锐化图像
figure,
subplot(121),imshow(I),title('原图')
subplot(122),imshow(img),title('Sobel')

%% Prewitt锐化
I = imread('lotus.bmp');
I=rgb2gray(I);
I=im2double(I); 
H1=[-1 -1 -1;0 0 0;1 1 1];H2=[-1 0 1;-1 0 1;-1 0 1];        %Prewitt算子模板，两个模板
R1= imfilter(I,H1);
R2= imfilter(I,H2);
edge=abs(R1)+abs(R2);           % 基于模板运算获取Prewitt梯度图像
img=I+edge;
figure,
subplot(121),imshow(I),title('原图')
subplot(122),imshow(img),title('Prewitt')

%% Robert锐化
I = imread('lotus.bmp');
I=rgb2gray(I);
H1= [1 0;0 -1]; H2 = [0 1; -1 0];           %Robert算子模板
R1 = imfilter(I,H1);
R2 = imfilter(I,H2);
edge= abs(R1) + abs(R2);        % 基于模板运算获取Robert梯度图像
img = I + edge;
figure
subplot(121),imshow(I),title('原图')
subplot(122),imshow(img),title('Robert')
%% laplacian 锐化
I = imread('lotus.bmp');
I=rgb2gray(I);
H1=[0 -1 0;-1 5 -1;0 -1 0];         %拉普拉斯锐化模板
img=imfilter(I,H1);
figure
subplot(121),imshow(I),title('原图')
subplot(122),imshow(img),title('Laplacian')
