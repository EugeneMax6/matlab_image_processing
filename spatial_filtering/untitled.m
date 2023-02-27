%% ʹ��matlab���ú����ľ�ֵ�˲���
Image=imread('Letters-a.jpg');
w1=fspecial('average',3);       % 3��3��ֵ�˲�ģ��
w2=fspecial('average',5);       % 5��5��ֵ�˲�ģ��
w3=fspecial('average',7);
w4=fspecial('average',9);
result1=imfilter(Image,w1,'conv','replicate');
result2=imfilter(Image,w2,'conv','replicate');
result3=imfilter(Image,w3,'conv','replicate');
result4=imfilter(Image,w4,'conv','replicate');
figure
subplot(151),imshow(Image),title('ԭͼ')
subplot(152),imshow(uint8(result1)),title('3��3��ֵ�˲�')
subplot(153),imshow(uint8(result2)),title('5��5��ֵ�˲�')
subplot(154),imshow(uint8(result3)),title('7��7��ֵ�˲�')
subplot(155),imshow(uint8(result4)),title('9��9��ֵ�˲�')

%% Sobel��
I = imread('lotus.bmp');
I=rgb2gray(I);
H1=[-1 -2 -1;0 0 0;1 2 1];H2=[-1 0 1;-2 0 2;-1 0 1];        %Sobel����ģ��
R1= imfilter(I,H1);
R2= imfilter(I,H2);
edge=abs(R1)+abs(R2);           % ����ģ�������ȡSobel�ݶ�ͼ��
img=I+edge;     %��ͼ��
figure,
subplot(121),imshow(I),title('ԭͼ')
subplot(122),imshow(img),title('Sobel')

%% Prewitt��
I = imread('lotus.bmp');
I=rgb2gray(I);
I=im2double(I); 
H1=[-1 -1 -1;0 0 0;1 1 1];H2=[-1 0 1;-1 0 1;-1 0 1];        %Prewitt����ģ�壬����ģ��
R1= imfilter(I,H1);
R2= imfilter(I,H2);
edge=abs(R1)+abs(R2);           % ����ģ�������ȡPrewitt�ݶ�ͼ��
img=I+edge;
figure,
subplot(121),imshow(I),title('ԭͼ')
subplot(122),imshow(img),title('Prewitt')

%% Robert��
I = imread('lotus.bmp');
I=rgb2gray(I);
H1= [1 0;0 -1]; H2 = [0 1; -1 0];           %Robert����ģ��
R1 = imfilter(I,H1);
R2 = imfilter(I,H2);
edge= abs(R1) + abs(R2);        % ����ģ�������ȡRobert�ݶ�ͼ��
img = I + edge;
figure
subplot(121),imshow(I),title('ԭͼ')
subplot(122),imshow(img),title('Robert')
%% laplacian ��
I = imread('lotus.bmp');
I=rgb2gray(I);
H1=[0 -1 0;-1 5 -1;0 -1 0];         %������˹��ģ��
img=imfilter(I,H1);
figure
subplot(121),imshow(I),title('ԭͼ')
subplot(122),imshow(img),title('Laplacian')
