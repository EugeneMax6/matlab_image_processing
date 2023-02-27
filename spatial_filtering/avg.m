function new_img=avg(img,n,mode)
%均值滤波
%img是图像矩阵，n为模板大小(n×n),mode是边缘填充方式
if(nargin<3)    
    mode=0;    %图像外部边界默认用0填充
end
[x y]=size(img);
new_img=zeros(x,y);
filled_img=fill_border(img,n,mode);     %对图像进行边界填充

%求均值，填充到新的图像矩阵new_img
for i=1:x
    for j=1:y
        %每一个n×n的模板内求出均值，填入中心的灰度
      new_img(i,j)=sum(sum(filled_img(i:i+n-1,j:j+n-1)))/(n*n);
    end
end
new_img=uint8(new_img);
end