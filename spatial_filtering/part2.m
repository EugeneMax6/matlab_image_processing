%�Աຯ��ʵ�����˲� part2.m
img=imread('lotus.bmp');
img=rgb2gray(img);
%sobel
img1=sobel(img);
figure,subplot(331),imshow(img);
title('ԭͼ')
subplot(332),imshow(img1);
title('sobel��Ե���')
img2=img+img1;
subplot(333),imshow(img2);
title('sobel��')
img_sobel5=sobel(img,5);
subplot(335),imshow(img_sobel5);
title('sobel 5*5 ��Ե���')
img5s=img+img_sobel5;
subplot(336),imshow(img5s)
title('sobel 5*5 ��')
img_sobel7=sobel(img,7);
subplot(338),imshow(img_sobel7);
title('sobel 7*7 ��Ե���')
img7s=img+img_sobel7;
subplot(339),imshow(img7s)
title('sobel 7*7 ��')

%prewitt
img3=prewitt(img);
figure,subplot(331),imshow(img);
title('ԭͼ')
subplot(332),imshow(img3);
title('prewitt��Ե���')
img4=img+img3;
subplot(333),imshow(img4);
title('prewitt��')
img_pre5=prewitt(img,5);
subplot(335),imshow(img_pre5);
title('prewitt 5*5 ��Ե���')
img5p=img+img_pre5;
subplot(336),imshow(img5p)
title('prewitt 5*5 ��')
img_pre7=prewitt(img,7);
subplot(338),imshow(img_pre7);
title('prewitt 7*7 ��Ե���')
img7p=img+img_pre7;
subplot(339),imshow(img7p)
title('prewitt 7*7 ��')

%robert
figure,subplot(131),imshow(img);
title('ԭͼ')
img5=robert(img);
subplot(132),imshow(img5);
title('robert��Ե���')
img6=img+img5;
subplot(133),imshow(img6);
title('robert��')

%������˹
figure,subplot(131),imshow(img);
title('ԭͼ')
img7=laplacian(img);
subplot(132),imshow(img7);
title('������˹Ե���')
img8=img+img7;
subplot(133),imshow(img8);
title('������˹��')
