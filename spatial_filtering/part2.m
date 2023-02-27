%◊‘±‡∫Ø ˝ µœ÷»ÒªØ¬À≤® part2.m
img=imread('lotus.bmp');
img=rgb2gray(img);
%sobel
img1=sobel(img);
figure,subplot(331),imshow(img);
title('‘≠Õº')
subplot(332),imshow(img1);
title('sobel±ﬂ‘µºÏ≤‚')
img2=img+img1;
subplot(333),imshow(img2);
title('sobel»ÒªØ')
img_sobel5=sobel(img,5);
subplot(335),imshow(img_sobel5);
title('sobel 5*5 ±ﬂ‘µºÏ≤‚')
img5s=img+img_sobel5;
subplot(336),imshow(img5s)
title('sobel 5*5 »ÒªØ')
img_sobel7=sobel(img,7);
subplot(338),imshow(img_sobel7);
title('sobel 7*7 ±ﬂ‘µºÏ≤‚')
img7s=img+img_sobel7;
subplot(339),imshow(img7s)
title('sobel 7*7 »ÒªØ')

%prewitt
img3=prewitt(img);
figure,subplot(331),imshow(img);
title('‘≠Õº')
subplot(332),imshow(img3);
title('prewitt±ﬂ‘µºÏ≤‚')
img4=img+img3;
subplot(333),imshow(img4);
title('prewitt»ÒªØ')
img_pre5=prewitt(img,5);
subplot(335),imshow(img_pre5);
title('prewitt 5*5 ±ﬂ‘µºÏ≤‚')
img5p=img+img_pre5;
subplot(336),imshow(img5p)
title('prewitt 5*5 »ÒªØ')
img_pre7=prewitt(img,7);
subplot(338),imshow(img_pre7);
title('prewitt 7*7 ±ﬂ‘µºÏ≤‚')
img7p=img+img_pre7;
subplot(339),imshow(img7p)
title('prewitt 7*7 »ÒªØ')

%robert
figure,subplot(131),imshow(img);
title('‘≠Õº')
img5=robert(img);
subplot(132),imshow(img5);
title('robert±ﬂ‘µºÏ≤‚')
img6=img+img5;
subplot(133),imshow(img6);
title('robert»ÒªØ')

%¿≠∆’¿≠Àπ
figure,subplot(131),imshow(img);
title('‘≠Õº')
img7=laplacian(img);
subplot(132),imshow(img7);
title('¿≠∆’¿≠Àπ‘µºÏ≤‚')
img8=img+img7;
subplot(133),imshow(img8);
title('¿≠∆’¿≠Àπ»ÒªØ')
