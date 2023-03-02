%myfft2.m
function [dstimg] = myfft2(img)
[size_x,size_y] = size(img);%获取输入图像的尺寸
%计算输入图像的fft
%这样计算的理论依据是傅里叶变换的可分离性，即二维的傅里叶变换可以分为两个一维的傅里变换
%计算x方向fft
for x = 1:size_x
    img_x = img(x,:);
    %(1)计算需要进行的蝶形运算的次数
    nums = log2(size_y);
    %(2)倒位序排列输入的原图srcimg
    half = round(size_y/2); %取输入图片尺寸的一半half
    half2 = half; %存副本
    n1 = size_y-2;
    for m = 1:n1
        if m<half2 %当小于half2时，交换i+1 与 half2+1 的元素
            t = img_x(m+1);
            img_x(m+1) = img_x(half2+1);
            img_x(half2+1) = t;
        end
        k = half;
        while(half2>=k) %根据倒位序的规则逐个确定要交换的元素
            half2 = half2-k;
            k = round(k/2);
        end
        half2 = half2+k;
    end
    %(3)进行蝶形运算
    for butterfly_level = 1:nums  %逐层计算每个蝶形
        butterfly_size = 2^(butterfly_level-1); %计算每层蝶形的尺寸
        for t = 0:butterfly_size-1
            w = t*(2^(nums-butterfly_level));%计算每层的旋转因子
            for k = t : 2^butterfly_level : size_y-1 %各蝶形结依次相距2^butterfly_level点
                xk = img_x(k+1)+img_x(k+1+butterfly_size)*exp(-j*2*pi*w/size_y);%根据蝶形计算规则计算每个蝶形的输出
                xkb = img_x(k+1)-img_x(k+1+butterfly_size)*exp(-j*2*pi*w/size_y);
                img_x(k+1) = xk;                                              %根据每个蝶形的同位存储性，保存存储结果
                img_x(k+butterfly_size+1) = xkb;
            end
        end
    end
    img(x,:) = img_x;
end
%计算y方向fft
for y = 1:size_y
    img_y = img(:,y);
    nums = log2(size_x);
    
    half = round(size_x/2); %取输入图片尺寸的一半half
    half2 = half;
    n1 = size_x-2;
    for m = 1:n1
        if m<half2 %当小于half2时，交换i+1 与 half2+1 的元素
            t = img_y(m+1);
            img_y(m+1) = img_y(half2+1);
            img_y(half2+1) = t;
        end
        k = half;
        while(half2>=k) %根据倒位序的规则逐个确定要交换的元素
            half2 = half2-k;
            k = round(k/2);
        end
        half2 = half2+k;
    end
    
    %(3)进行蝶形运算
    for butterfly_level = 1:nums  %逐层计算每个蝶形
        butterfly_size = 2^(butterfly_level-1); %计算每层蝶形的尺寸
        for t = 0:butterfly_size-1
            w = t*(2^(nums-butterfly_level)); %计算每层的旋转因子
            for k = t : 2^butterfly_level : size_x-1 %各蝶形结依次相距2^butterfly_level点
                xk = img_y(k+1)+img_y(k+1+butterfly_size)*exp(-j*2*pi*w/size_x);%根据蝶形计算规则计算每个蝶形的输出
                xkb = img_y(k+1)-img_y(k+1+butterfly_size)*exp(-j*2*pi*w/size_x);
                img_y(k+1) = xk;%根据每个蝶形的同位存储性，保存存储结果
                img_y(k+butterfly_size+1) = xkb;
            end
        end
    end
    img(:,y) = img_y; %在上述计算结果上对y方向做fft
end
dstimg = img;