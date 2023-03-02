%% part 1 ʹ��MATLAB�еĺ���fft2��fftshift��ifft2ʵ��һ���Ҷ�ͼ��ӿ���任��Ƶ��
clc,clear,close all
f=imread('lena.bmp');
subplot(2,2,1);imshow(f);title('ԭͼ');
F=fft2(f);          %���ٸ���Ҷ�任
F1=log(abs(F)+1);   %ȡģ���������� 
subplot(2,2,2);imshow(F1,[]);title('����ҶƵ��ͼ');
Fs=fftshift(F);      %FFTƵ�����Ļ�����Ƶ��ͼ����Ƶ�ʳɷ��ƶ���Ƶ��ͼ����
S=log(abs(Fs)+1);    %ȡģ���������� 
subplot(2,2,3);imshow(S,[]);title('Ƶ���Ƶ����ĺ��Ƶ��ͼ');
fr=real(ifft2(ifftshift(Fs)));  %������Ҷ�任��Ƶ����任���ռ��򣬲�ȡʵ��
ret=im2uint8(mat2gray(fr));    %����ͼ������
subplot(2,2,4);imshow(ret),title('�渵��Ҷ�任');

%% part 2  �ԻҶ�ͼ����п���/Ƶ���˲�
f = imread('lena.bmp');
figure,subplot(221),imshow(f);title('ԭͼ');
f=im2double(f);         %ת��Ϊdouble
F=fft2(f);              %���ٸ���Ҷ�任������ת��Ƶ��
S=fftshift(log(abs(F)+1));      %ȡģ�����š����Ļ�
subplot (222),imshow(S),title('����ҶƵ��ͼ');
%�ռ��˲���
h=fspecial('sobel');        %sobel�˲���
gs=imfilter(f,h);           %�����˲�
subplot(223),imshow(gs,[]),title('�����˲����');
%Ƶ���˲�
PQ=paddedsize(size(f));             %ͼ���Ե����
H=freqz2(h,PQ(2),PQ(1));        %���Ȱѿռ��˲���ת��Ƶ���˲���
F1=fftshift(fft2(f,PQ(1),PQ(2)));           %Ƶ�����Ļ�
G1=F1.*H;           %ͼ��任���˲��������
g1=real(ifft2(G1));                 %ȡ����Ҷ���任��ʵ��
gf=g1(1:size(f,1),1:size(f,2));         %ȡͼ��ԭʼ��С�Ĳ���
subplot(224),imshow(gs,[]),title('Ƶ���˲����');


%% part3.1 ʹ��MATLAB�еĺ���lpfilter()����ͨ�˲�
clear,clc;
f=imread('lena.bmp');
figure,subplot(221),imshow(f);title('ԭͼ');
%���ɵ�ͨ�˲���
PQ=paddedsize(size(f));     %ͼ���Ե��չ
D0=0.05*PQ(1);      %�˲����뾶��D0
H1=lpfilter('ideal',PQ(1),PQ(2),D0);        %�����ͨ�˲���
H2=lpfilter('btw',PQ(1),PQ(2),D0,2);        %������˹��ͨ�˲���
H3=lpfilter('gaussian',PQ(1),PQ(2),D0);     %��˹��ͨ�˲���
%����Ƶ���˲�
%���������ͼ��ĸ���Ҷ�任
F=fft2(f,PQ(1),PQ(2));
%ͼ��任���˲����������
G1=F.*H1;
G2=F.*H2;
G3=F.*H3;
%����G�ĸ���Ҷ���任��ʵ��
g1=real(ifft2(G1));
g2=real(ifft2(G2));
g3=real(ifft2(G3));
%��ͼ��g���õ�ԭʼͼ��f�Ĵ�С
gf1=mat2gray(g1(1:size(f,1),1:size(f,2)));
gf2=mat2gray(g2(1:size(f,1),1:size(f,2)));
gf3=mat2gray(g3(1:size(f,1),1:size(f,2)));
subplot(222),imshow(gf1,[]),title('�����ͨ�˲����')
subplot(223),imshow(gf2,[]),title('������˹��ͨ�˲����')
subplot(224),imshow(gf3,[]),title('��˹��ͨ�˲����')

%% part3.2 ʹ��MATLAB�еĺ���hpfilter()
clear,clc;
f=imread('lena.bmp');
figure,subplot(221),imshow(f);title('ԭͼ');
%���ɸ�ͨ�˲���
PQ=paddedsize(size(f));
D0=0.05*PQ(1);      %�뾶��D0
H1=hpfilter('ideal',PQ(1),PQ(2),D0);        %�����ͨ�˲���
H2=hpfilter('btw',PQ(1),PQ(2),D0,2);        %������˹��ͨ�˲���
H3=hpfilter('gaussian',PQ(1),PQ(2),D0);     %��˹��ͨ�˲���  
%����Ƶ���˲�
%���������ͼ��ĸ���Ҷ�任
F=fft2(f,PQ(1),PQ(2));
%ͼ��任���˲��������
G1=F.*H1;
G2=F.*H2;
G3=F.*H3;
%����G�ĸ���Ҷ���任��ʵ��
g1=real(ifft2(G1));
g2=real(ifft2(G2));
g3=real(ifft2(G3));
%��ͼ��g���õ�ԭʼͼ��f�Ĵ�С
gf1=mat2gray(g1(1:size(f,1),1:size(f,2)));
gf2=mat2gray(g2(1:size(f,1),1:size(f,2)));
gf3=mat2gray(g3(1:size(f,1),1:size(f,2)));
subplot(222),imshow(gf1,[]),title('�����ͨ�˲����')
subplot(223),imshow(gf2,[]),title('������˹��ͨ�˲����')
subplot(224),imshow(gf3,[]),title('��˹��ͨ�˲����')

%% part4 �Ա�ʵ�ֿ��ٸ���Ҷ�任����fft2��ʵ�ֶ�һ���Ҷ�ͼ��ʵ�ָ���Ҷ�任��
clear;
clc;
%ʵ��һ���Ҷ�ͼ��lena.bmp���ӿ���任��Ƶ��
image=imread('lena.bmp');
im=im2double(image);
image_f=myfft2(im);  %����Ҷ�任
image_f1=log(abs(image_f)+1); %������������
image2=fftshift(image_f); %Ƶ�����Ļ�
image2=log(abs(image2)+1); %������������
figure(1)
subplot(221);imshow(image);title('ԭͼ');
subplot(222);imshow(image_f1,[]);title('����Ҷ�任Ƶ��ͼ');
subplot(223);imshow(image2,[]);title('Ƶ�����Ļ�');
image_if=im2uint8(real(ifft2(image_f))); %������Ҷ�任
subplot(224);imshow(image_if);title('������Ҷ�任');
