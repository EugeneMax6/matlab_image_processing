function G=fill_border(img,n,mode)
%对图像边缘进行填充
[x y]=size(img);
G=zeros(x+n-1,y+n-1);   %对边界填充的图像矩阵大小为(x+n-1)*(y+n-1)
G((n-1)/2+1:x+((n-1)/2),(n-1)/2+1:y+((n-1)/2))=img;     %将原图的灰度值填入新的图像矩阵
%根据mode的类型对新的图像矩阵进行填充
if isa(mode,'double')==1
    %外部边界通过x来填充
    G(1:(n-1)/2,1:y+n-1)=mode;
    G(x+(n-1)/2+1:x+n-1,1:y+n-1)=mode;
    G(1:x+n-1,1:(n-1)/2)=mode;
    G(1:x+n-1,y+(n-1)/2+1:y+n-1)=mode;
elseif strcmp(mode,'replicate')==1
    %复制边界
    %先复制四个角的灰度值
    G(1:(n-1)/2,1:(n-1)/2)=img(1,1);
    G(x+(n-1)/2:x+n-1,y+(n-1)/2:y+n-1)=img(x,y);
    G(1:(n-1)/2,y+(n-1)/2:y+n-1)=img(1,y);
    G(x+(n-1)/2:x+n-1,1:(n-1)/2)=img(x,1);
    %其他边界复制
    for i=1:(n-1)/2
        G(i,(n-1)/2+1:y+(n-1)/2)=img(1,1:y);
        G(x+(n-1)/2+i,(n-1)/2+1:y+(n-1)/2)=img(x,1:y);
        G((n-1)/2+1:x+(n-1)/2,i)=img(1:x,1);
        G((n-1)/2+1:x+(n-1)/2,y+(n-1)/2+i)=img(1:x,y);
    end
elseif strcmp(mode,'symmetric')==1
    %沿边界进行镜像反射
    %先上下镜像反射
    for i=1:(n-1)/2
        G(i,(n-1)/2+1:y+(n-1)/2)=img((n-1)/2-i+1,1:y);
        G(x+(n-1)/2+i,(n-1)/2+1:y+(n-1)/2)=img(x-i+1,1:y);
    end
    %再左右反射
    for i=1:(n-1)/2
        G(1:x+n-1,i)=G(1:x+n-1,(n-1)/2-i+1);
        G(1:x+n-1,x+(n-1)/2+i)=G(1:x+n-1,y+(n-1)/2-i+1);
    end
elseif strcmp(mode,'circular')==1
    %作为二维周期函数进行扩展
    G1=zeros(3*x,3*y);
    G1(1:x,1:y)=img;
    G1(1:x,y+1:2*y)=img;
    G1(1:x,2*y+1:3*y)=img;
    G1(x+1:2*x,1:y)=img;
    G1(x+1:2*x,y+1:2*y)=img;
    G1(x+1:2*x,2*y+1:3*y)=img;
    G1(2*x+1:3*x,1:y)=img;
    G1(2*x+1:3*x,y+1:2*y)=img;
    G1(2*x+1:3*x,2*y+1:3*y)=img;
    G=G1(x-(n-1)/2+1:2*x+(n-1)/2,y-(n-1)/2+1:2*y+(n-1)/2);
end
end