%拉普拉斯边缘检测
function new_img=laplacian(img)
[x y]=size(img);
img=double(img);
new_img=zeros(x,y);
%拉普拉斯模板系数
H=[0,-1,0;-1,4,-1;0,-1,0];
for i=1:x-2
    for j=1:y-2
        t=img(i:i+2,j:j+2);
        G=H.*t;
        G=abs(sum(G(:)));
        new_img(i+1,j+1)=G;
    end
end
new_img=uint8(new_img);
end