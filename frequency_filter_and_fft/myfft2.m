%myfft2.m
function [dstimg] = myfft2(img)
[size_x,size_y] = size(img);%��ȡ����ͼ��ĳߴ�
%��������ͼ���fft
%������������������Ǹ���Ҷ�任�Ŀɷ����ԣ�����ά�ĸ���Ҷ�任���Է�Ϊ����һά�ĸ���任
%����x����fft
for x = 1:size_x
    img_x = img(x,:);
    %(1)������Ҫ���еĵ�������Ĵ���
    nums = log2(size_y);
    %(2)��λ�����������ԭͼsrcimg
    half = round(size_y/2); %ȡ����ͼƬ�ߴ��һ��half
    half2 = half; %�渱��
    n1 = size_y-2;
    for m = 1:n1
        if m<half2 %��С��half2ʱ������i+1 �� half2+1 ��Ԫ��
            t = img_x(m+1);
            img_x(m+1) = img_x(half2+1);
            img_x(half2+1) = t;
        end
        k = half;
        while(half2>=k) %���ݵ�λ��Ĺ������ȷ��Ҫ������Ԫ��
            half2 = half2-k;
            k = round(k/2);
        end
        half2 = half2+k;
    end
    %(3)���е�������
    for butterfly_level = 1:nums  %������ÿ������
        butterfly_size = 2^(butterfly_level-1); %����ÿ����εĳߴ�
        for t = 0:butterfly_size-1
            w = t*(2^(nums-butterfly_level));%����ÿ�����ת����
            for k = t : 2^butterfly_level : size_y-1 %�����ν��������2^butterfly_level��
                xk = img_x(k+1)+img_x(k+1+butterfly_size)*exp(-j*2*pi*w/size_y);%���ݵ��μ���������ÿ�����ε����
                xkb = img_x(k+1)-img_x(k+1+butterfly_size)*exp(-j*2*pi*w/size_y);
                img_x(k+1) = xk;                                              %����ÿ�����ε�ͬλ�洢�ԣ�����洢���
                img_x(k+butterfly_size+1) = xkb;
            end
        end
    end
    img(x,:) = img_x;
end
%����y����fft
for y = 1:size_y
    img_y = img(:,y);
    nums = log2(size_x);
    
    half = round(size_x/2); %ȡ����ͼƬ�ߴ��һ��half
    half2 = half;
    n1 = size_x-2;
    for m = 1:n1
        if m<half2 %��С��half2ʱ������i+1 �� half2+1 ��Ԫ��
            t = img_y(m+1);
            img_y(m+1) = img_y(half2+1);
            img_y(half2+1) = t;
        end
        k = half;
        while(half2>=k) %���ݵ�λ��Ĺ������ȷ��Ҫ������Ԫ��
            half2 = half2-k;
            k = round(k/2);
        end
        half2 = half2+k;
    end
    
    %(3)���е�������
    for butterfly_level = 1:nums  %������ÿ������
        butterfly_size = 2^(butterfly_level-1); %����ÿ����εĳߴ�
        for t = 0:butterfly_size-1
            w = t*(2^(nums-butterfly_level)); %����ÿ�����ת����
            for k = t : 2^butterfly_level : size_x-1 %�����ν��������2^butterfly_level��
                xk = img_y(k+1)+img_y(k+1+butterfly_size)*exp(-j*2*pi*w/size_x);%���ݵ��μ���������ÿ�����ε����
                xkb = img_y(k+1)-img_y(k+1+butterfly_size)*exp(-j*2*pi*w/size_x);
                img_y(k+1) = xk;%����ÿ�����ε�ͬλ�洢�ԣ�����洢���
                img_y(k+butterfly_size+1) = xkb;
            end
        end
    end
    img(:,y) = img_y; %�������������϶�y������fft
end
dstimg = img;