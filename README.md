# matlab_image_processing

学习MATLAB图像处理时的一些练习程序，主要是灰度图像处理

参考书目：冈萨雷斯《数字图像处理》/《数字图像处理——使用MATLAB分析与实现》 清华大学出版社

### 一、直方图均衡化和规定化

[直方图均衡化和规定化](https://github.com/EugeneMax6/matlab_image_processing/tree/main/histogram)

1.[统计图片灰度直方图](https://github.com/EugeneMax6/matlab_image_processing/blob/main/histogram/Hist.m)

2.课程任务：

(1)[调用matlab函数完成直方图均衡化和规定化；](https://github.com/EugeneMax6/matlab_image_processing/blob/main/histogram/untitled1.m)

（2）[调用Matlab关于直方图的相关函数完成直方图均衡化和规定化函数自编；](https://github.com/EugeneMax6/matlab_image_processing/blob/main/histogram/untitled2.m)

（3）[在Matlab平台下，不利用直方图相关函数自编函数实现直方图均衡化和规定化算法](https://github.com/EugeneMax6/matlab_image_processing/blob/main/histogram/untitled3.m)

3.[实验报告](https://github.com/EugeneMax6/matlab_image_processing/blob/main/histogram/%E5%AE%9E%E9%AA%8C%E6%8A%A5%E5%91%8A%E4%B8%80.pdf)

4.[PPT](https://github.com/EugeneMax6/matlab_image_processing/blob/main/histogram/PPT.pdf)

### 二、空间滤波

[空间滤波](https://github.com/EugeneMax6/matlab_image_processing/tree/main/spatial_filtering)

1.[对图像边缘进行填充](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/fill_border.m)

2.[均值滤波器](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/avg.m)

3.[Sobel](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/sobel.m)

4.[robert](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/robert.m)

5.[Prewitt](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/prewitt.m)

6.[拉普拉斯Laplacian](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/prewitt.m)

7.课程任务：

•    [基础实验内容](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/untitled.m)：

•    利用课件上关于均值滤波器的代码，分别对一幅图像实现3*3,5*5,7*7,9*9的均值滤波，并对实验结果进行分析；

•    利用课件上关于锐化滤波器的代码，分别对一幅图像实现3*3,5*5,7*7,9*9的sobel、prewitt滤波，Robert锐化滤波和拉普拉斯锐化滤波并对实验结果进行分析。

•    提高实验内容：

•    [自编均值滤波器](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/part1.m)，对一幅图像实现填充后，并完成3*3,5*5,7*7,9*9,11*11的均值滤波。

•    [自编锐化滤波器](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/part2.m)，对一幅图像实现填充后，并完成sobel、prewitt滤波，Robert锐化滤波和拉普拉斯3*3,5*5,7*7,9*9,11*11的锐化滤波

8.[实验报告](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/%E5%AE%9E%E9%AA%8C%E6%8A%A5%E5%91%8A%E4%BA%8C.pdf)

9.[PPT半成品](https://github.com/EugeneMax6/matlab_image_processing/blob/main/spatial_filtering/%E5%AE%9E%E9%AA%8C%E4%BA%8Cppt_%E5%8D%8A%E6%88%90%E5%93%81v2.pdf)

成品忘记保存了 凑合一下

### 三、频率域滤波和离散傅里叶变换

使用MATLAB中的函数fft2，fftshift，ifft2实现一幅灰度图像（lena.bmp）从空域变换到频域。

实现空域锐化滤波器和频域锐化滤波器对一幅灰度图像进行滤波处理。

使用MATLAB中的函数hpfilter（），lpfilter（）分别调用理想低通（高通）滤波器、巴特沃斯低通（高通）滤波器、高斯低通（高通）滤波器实现对lena.bmp进行低通和高通滤波处理,并对实验结果进行分析。

提高题：自编实现快速傅里叶变换函数fft2（），实现对一幅灰度图像实现傅里叶变换。

这里待补充
